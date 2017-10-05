class PlayerTeamsController < ApplicationController
  before_action :require_login
  def create
    @league = League.find_by_id(params[:league_id])
    @draft = @league.draft
    @team = Team.find_by_id(@draft.order[@draft.next_pick_index])
    @player_team = PlayerTeam.new player_team_params
    @player_team.team = @team
    if @player_team.save
      @draft.history << @player_team.player_id
      @draft.next_pick_index += 1
      @draft.save
      ActionCable.server.broadcast "draft_picks_#{params[:league_id]}",
        player: @player_team.player,
        team: @player_team.team,
        draft: @draft,
        next_team: Team.find_by_id(@draft.order[@draft.next_pick_index]),
        last_team: Team.find_by_id(@draft.order[@draft.next_pick_index+9]),
        current_user: @team.user
    else
      flash[:error] = @player_team.errors.full_messages.join(". ")
      redirect_to draft_path(@draft.league.id, @draft.id)
    end

  end
  private

  def player_team_params
    params.require(:player_team).permit(:player_id)
  end
end
