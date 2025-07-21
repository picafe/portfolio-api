class Social < ApplicationRecord
  belongs_to :contact

  validates :name, presence: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }
  validates :logo_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
end
