class DraftsController < ApplicationController

  def create
    @draft = Draft.new
    @draft.next_pick_index = 0
    @draft.league = League.find_by_id(params[:league_id])
    @draft_odd_round_order = []
    @draft.league.teams.each do |team|
      @draft_odd_round_order << team['id']
    end
    @draft_even_round_order = @draft_odd_round_order.reverse
    round = 1
    until round > 14 do
      if round % 2 == 1
        (@draft.order << @draft_odd_round_order).flatten!
      else
        (@draft.order << @draft_even_round_order).flatten!
      end
      round += 1
    end
    # @draft.order = [@draft.league.teams[0].id,
    #                 @draft.league.teams[1].id,
    #                 @draft.league.teams[2].id]
    if @draft.save
      redirect_to draft_path(@draft.league.id, @draft.id)
    else
      flash[:error] = @draft.errors.full_messages.join(". ")
      redirect_to @draft.league
    end
  end

  def show
    @draft = League.find_by_id(params[:id]).draft
    @team_order = Team
    @team = Team.find_by_id(@draft.order[@draft.next_pick_index])
    @player_team = PlayerTeam.new
    @players = Player.all - @draft.league.players
    # Draft Order [1, 2, 3]
    # Draft Next Pick Index = 0 or 1 or 2
  end

end
