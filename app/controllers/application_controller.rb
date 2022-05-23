class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
   
  

    private
    def get_post
        @post = Post.find(params[:id])
    end

    def get_user
        @user = User.find(params[:id])
    end

    def get_comment
        @post = Post.find(params[:post_id])
       # @comment = @post.comments.find(params[:id])
    end

end
