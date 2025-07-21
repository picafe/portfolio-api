class Skill < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :proficiency, presence: true, inclusion: { in: 1..3 }
  validates :logo_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

  scope :by_proficiency, -> { order(proficiency: :desc, name: :asc) }

  def proficiency_text
    case proficiency
    when 1 then "Beginner"
    when 2 then "Intermediate"
    when 3 then "Advanced"
    end
  end
end
