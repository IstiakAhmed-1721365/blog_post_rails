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

	# Follows a user.
	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	  end
	
		# Unfollows a user.
	  def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	  end
	
		# Returns true if the current user is following the other user.
	  def following?(other_user)
		following.include?(other_user)
	  end
	  
	

	private

	def get_user
        @user = User.find(params[:id])
    end

end
