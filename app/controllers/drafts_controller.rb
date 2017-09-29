class DraftsController < ApplicationController

  def create
    @draft = Draft.new
    @draft.next_pick_index = 0
    @draft.league = League.find_by_id(params[:league_id])
    @draft.order = [@draft.league.teams[0].id,
                    @draft.league.teams[1].id,
                    @draft.league.teams[2].id]
    if @draft.save
      redirect_to draft_path(@draft.league.id, @draft.id)
    else
      flash[:error] = @draft.errors.full_messages.join(". ")
      redirect_to @draft.league
    end
  end

  def show
    @draft = Draft.find_by_id(params[:id])
    @team = Team.find_by_id(@draft.order[@draft.next_pick_index])
    @player_team = PlayerTeam.new
    @players = Player.all
    # Draft Order [1, 2, 3]
    # Draft Next Pick Index = 0 or 1 or 2
  end
end
