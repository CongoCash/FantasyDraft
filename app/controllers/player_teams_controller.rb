class PlayerTeamsController < ApplicationController
  def create
    @league = League.find_by_id(params[:league_id])
    @draft = @league.draft
    @team = Team.find_by_id(@draft.order[@draft.next_pick_index])
    @player_team = PlayerTeam.new player_team_params
    @player_team.team = @team
    if @player_team.save
      flash[:success] = "Succesfully drafted a player!"
      @draft.history << @player_team.player_id
      @draft.next_pick_index += 1
      @draft.save
    else
      flash[:error] = @player_team.errors.full_messages.join(". ")
    end
      redirect_to draft_path(@draft.league.id, @draft.id)
  end
  private

  def player_team_params
    params.require(:player_team).permit(:player_id)
  end
end
