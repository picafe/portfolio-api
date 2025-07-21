class Contact < ApplicationRecord
  has_many :socials, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :github_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

  accepts_nested_attributes_for :socials, allow_destroy: true, reject_if: :all_blank

  def self.current
    first || create!(email: "contact@example.com")
  end
end
