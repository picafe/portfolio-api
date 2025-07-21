class PagesController < ApplicationController
  allow_unauthenticated_access only: [ :index, :about, :contact ]
  
  def index
    redirect_to dashboard_path if authenticated?
  end
  
  def dashboard
    redirect_to new_session_path unless authenticated?
    
    @homepage_section = HomepageSection.current
    @skills = Skill.by_proficiency
    @contact = Contact.current
  end

  def about
    render json: { message: "This is the about page of the Portfolio API" }
  end

  def contact
    render json: { message: "This is the contact page of the Portfolio API" }
  end
end
