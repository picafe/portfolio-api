class HomepageSectionsController < ApplicationController
  before_action :set_homepage_section

  def show
  end

  def edit
  end

  def update
    if @homepage_section.update(homepage_section_params)
      redirect_to dashboard_path, notice: 'Homepage section updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_homepage_section
    @homepage_section = HomepageSection.current
  end

  def homepage_section_params
    params.require(:homepage_section).permit(:description, :particle_effects_enabled)
  end
end
