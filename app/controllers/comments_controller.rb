class CommentsController < ApplicationController

	before_action :get_comment, only: [:create, :destroy]

    def create
		#byebug
		#@post = Post.find(params[:post_id])
	 	@comment = @post.comments.new(comment_params.merge(user_id: current_user.id)) #create private function for allowed params
		if @comment.save
			CommentMailer.comment_created.deliver_later
			redirect_to post_path(@post)
		else
			render new
		end	
	end

	def destroy
		#@post = Post.find(params[:post_id]) #refactor into before_action
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private

	def comment_params
		params.require(:comment).permit(:id, :content)
	end

	def get_comment
        @post = Post.find(params[:post_id])
        #@comment = @post.comments.find(params[:id])
    end
end
