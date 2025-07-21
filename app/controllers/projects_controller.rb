class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy, :remove_gallery_image ]

  def index
    @projects = Project.ordered
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "Project was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    # Handle gallery image removal
    if params[:remove_gallery_images].present?
      params[:remove_gallery_images].each do |blob_id|
        @project.remove_gallery_image_by_blob_id(blob_id)
      end
    end

    if params[:project][:new_gallery_images].present?
      @project.gallery_images.attach(params[:project][:new_gallery_images])
    end

    # Update project with new attributes
    if @project.update(project_params)
      redirect_to edit_project_path(@project), notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project was successfully deleted."
  end

  def remove_gallery_image
    if params[:attachment_id].present?
      @project.remove_gallery_image(params[:attachment_id])
      redirect_to edit_project_path(@project), notice: "Image removed successfully."
    else
      redirect_to edit_project_path(@project), alert: "Could not remove image."
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :live_url, :github_url,
                                   :tools_used, :timeline, :featured, :cover_image,
                                   gallery_images: [])
  end
end
