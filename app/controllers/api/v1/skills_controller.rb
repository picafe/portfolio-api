class Api::V1::SkillsController < Api::V1::BaseController
  def index
    skills = Skill.by_proficiency.map do |skill|
      {
        id: skill.id,
        name: skill.name,
        proficiency: skill.proficiency,
        proficiency_text: skill.proficiency_text,
        logo_url: skill.logo_url
      }
    end

    render json: { skills: skills }
  end
end
