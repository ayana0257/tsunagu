class BlogsController < ApplicationController

	# before_action :correct_user, only: [:edit, :update, :destroy]

	def new
		@blog = Blog.new
		@blog.blog_images.build
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_user.id
		@blog.save!
		redirect_to blog_path(@blog.id)
	end

	def show
		@blog = Blog.find(params[:id])
		@comment = Comment.new
		@comments = @blog.comments
		# @comments = @blog.comments.includes(:user).all
		# @comment = @blog.comments.build(user_id: current_user.id) if curent_user
	end

	def index
		@blogs = Blog.all
		@blogs = Blog.page(params[:page]).per(10).order('created_at DESC')
		# @user = @blogs.user
		# @user = User.find_by(id: 1)
		# @blogs = Blog.where(user_id: @user.id).all
	end

	def edit
		@blog = Blog.find(params[:id])
		# unless @blogs == current_user.blogs
		# redirect_to root_path
		# end
	end

	def update
		blog = Blog.find(params[:id])
		if blog.update!(blog_params)
		flash[:success] = '更新できました！'
		redirect_to blog_path(blog.id)
		else
		render :edit
		end
	end

	def destroy
		blog = Blog.find(params[:id])
		if blog.destroy!
		flash[:success] = '削除しました'
		redirect_to root_path
		else
		render :show
		end
	end


	private
	def blog_params
		params.require(:blog).permit(:title, :body, {blog_images_images: []})
	end

	# def correct_user
	# 	blog = Blog.find(params[:id])
	# 	if current_user != user
	# 	redirect_to root_path
	# 	end
	# end


end
