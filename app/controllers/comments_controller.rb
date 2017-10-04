class CommentsController < ApplicationController
	def create
		@comment = Comment.new comment_params
		@comment.user = current_user
		@comment.draft = League.find(params[:id]).draft
		if @comment.save
			ActionCable.server.broadcast "comments_#{params[:id]}",
        comment: @comment.content,
        user: @comment.user.name
      # head :ok
		else
			flash[:error] = @comment.errors.full_messages.join(". ")
			redirect_to draft_path(@comment.draft)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
