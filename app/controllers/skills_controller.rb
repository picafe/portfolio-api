class SkillsController < ApplicationController
  before_action :set_skill, only: %i[ show edit update destroy ]

  def index
    @skills = Skill.by_proficiency
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      redirect_to dashboard_path, notice: "Skill was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to dashboard_path, notice: "Skill was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy
    redirect_to dashboard_path, notice: "Skill was successfully deleted."
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :proficiency, :logo_url)
  end
end
