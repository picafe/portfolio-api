class Api::V1::PortfolioController < Api::V1::BaseController
  def index
    render json: {
      homepage_section: homepage_section_data,
      skills: skills_data,
      projects: projects_data,
      contact: contact_data
    }
  end

  private

  def homepage_section_data
    section = HomepageSection.current
    {
      description: section.description,
      particle_effects_enabled: section.particle_effects_enabled
    }
  end

  def skills_data
    Skill.by_proficiency.map do |skill|
      {
        id: skill.id,
        name: skill.name,
        proficiency: skill.proficiency,
        proficiency_text: skill.proficiency_text,
        logo_url: skill.logo_url
      }
    end
  end

  def projects_data
    Project.ordered.map do |project|
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

  def contact_data
    contact = Contact.current
    {
      email: contact.email,
      github_url: contact.github_url,
      socials: contact.socials.map do |social|
        {
          id: social.id,
          name: social.name,
          url: social.url,
          logo_url: social.logo_url
        }
      end
    }
  end
end
