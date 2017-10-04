class DraftPicksChannel < ApplicationCable::Channel  
  def subscribed
    stream_from "draft_picks_#{params[:id]}"
  end
end  