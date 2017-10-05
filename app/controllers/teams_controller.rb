class TeamsController < ApplicationController
  before_action :require_login, only:[:new]

  def new
    @team = Team.new
    @league = League.find_by_id(params[:league_id])
    if @league.teams.length >= @league.number_of_teams
      flash[:error] = "League is already full."
      redirect_to @league
    end
  end

  def create
    @team = Team.new(team_params)
    @team.league = League.find_by_id(params[:league_id])
    @team.user = current_user
    if @team.save
      redirect_to @team.league
    else
      flash[:error] = @team.errors.full_messages.join(". ")
      redirect_to new_league_team_path
    end
  end

  def show
    @team = Team.find_by_id(params[:id])
    @league = League.find_by_id(params[:league_id])
  end

  def destroy
    @team = Team.find_by_id(params[:team_id])
    @team.delete
    redirect_to league_path(params[:league_id])
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
