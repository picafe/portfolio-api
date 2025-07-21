class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    projects = Project.ordered.map { |project| project_json(project) }
    render json: { projects: projects }
  end

  def show
    project = Project.find(params[:id])
    render json: project_json(project)
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Project not found" }, status: :not_found
  end

  private

  def project_json(project)
    {
      id: project.id,
      title: project.title,
      description: project.description,
      live_url: project.live_url,
      github_url: project.github_url,
      tools_used: project.tools_array,
      timeline: project.timeline,
      featured: project.featured,
      cover_image_url: project.cover_image.attached? ? url_for(project.cover_image) : nil,
      gallery_images_urls: project.gallery_images.attached? ? project.gallery_images.map { |img| url_for(img) } : []
    }
  end
end
