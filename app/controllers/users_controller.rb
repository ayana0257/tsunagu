class UsersController < ApplicationController
	def top
	end

	def index
		@users = User.all
		@users = User.page(params[:page]).per(10).order('created_at DESC')
	end

	def show
		@user = User.find(params[:id])
		@blogs = @user.blogs
		# @blogs = Blog.all
		# @blogs = Blog.where(:user_id, @user.id)
	end

	def edit
		@user = User.find(params[:id])
		# unless @user.id == current_user.id
		# redirect_to root_path
    # end
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params)
		flash[:success] = '更新できました！'
		redirect_to user_path(user.id)
		else
		render :edit
		end
	end

private
    def user_params
    	params.require(:user).permit(:name, :image, :profile)
    end
end
