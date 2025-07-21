class ContactsController < ApplicationController
  before_action :set_contact

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to dashboard_path, notice: 'Contact information updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_contact
    @contact = Contact.current
  end

  def contact_params
    params.require(:contact).permit(:email, :github_url, socials_attributes: [:id, :name, :url, :logo_url, :_destroy])
  end
end
