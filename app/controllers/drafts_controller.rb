class DraftsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :check_owner, only: [:create]
  def create
    @draft = Draft.new
    @draft.next_pick_index = 0
    @draft.league = League.find_by_id(params[:id])
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

    if @draft.save
      redirect_to draft_path(@draft.league.id, @draft.id)
    else
      flash[:error] = @draft.errors.full_messages.join(". ")
      redirect_to @draft.league
    end
  end

  def show
    @draft = League.find_by_id(params[:id]).draft
    @user = League.find_by_id(params[:id]).user
    if (@draft.next_pick_index >= @draft.order.length)
        redirect_to @draft.league and return
    end
    @team = Team.find_by_id(@draft.order[@draft.next_pick_index])
    @player_team = PlayerTeam.new
    @players = Player.all - @draft.league.players
    @comment = Comment.new
  end

end

private


def check_owner
  @draft = Draft.find_by_id(params[:id])
  if session[:user_id].to_s != @draft.user.id.to_s
    redirect_to user_path(current_user)
  end
end
