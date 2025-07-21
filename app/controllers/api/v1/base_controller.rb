class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  allow_unauthenticated_access

  before_action :set_cors_headers

  private

  def set_cors_headers
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = "GET, OPTIONS"
    headers["Access-Control-Allow-Headers"] = "Content-Type"
  end
end
