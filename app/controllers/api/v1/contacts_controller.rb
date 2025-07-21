class Api::V1::ContactsController < Api::V1::BaseController
  def show
    contact = Contact.current
    render json: {
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
