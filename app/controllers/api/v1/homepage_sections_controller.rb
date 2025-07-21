class Api::V1::HomepageSectionsController < Api::V1::BaseController
  def show
    section = HomepageSection.current
    render json: {
      description: section.description,
      particle_effects_enabled: section.particle_effects_enabled
    }
  end
end
