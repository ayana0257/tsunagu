class UsersController < ApplicationController
	def top
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@blogs = @user.blogs
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user.id)
	end

private
    def user_params
    	params.require(:user).permit(:name, :image, :profile)
    end
end
