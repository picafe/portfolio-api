class HomepageSection < ApplicationRecord
  validates :description, presence: true, length: { minimum: 10 }
  validates :particle_effects_enabled, inclusion: { in: [true, false] }

  def self.current
    first || create!(description: "Welcome to my portfolio")
  end
end
