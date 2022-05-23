class UsersController < ApplicationController

	before_action :get_user, only: [:show, :edit, :update, :destroy]

    def index
		@users = User.all
	end

	def following
		@title = "Following"
		@user  = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page])
		render 'show_follow'
	end
	
	def followers
		@title = "Followers"
		@user  = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end

	private

	def get_user
        @user = User.find(params[:id])
    end

end
