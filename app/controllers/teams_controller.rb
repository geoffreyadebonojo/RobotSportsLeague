class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :destroy, :edit, :update]

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(create_params)

    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def update
    if @team.update(patch_params)
      redirect_to profile_path, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully destroyed.'
  end

  private
    def set_team
      @team = Team.find(session[:team_id])
    end

    def create_params
      params.require('/registration').permit(:name, :email, :password, :password_confirmation)
    end

    def patch_params
      params.require(:team).permit(:name, :email, :password, :password_confirmation)
    end
end
