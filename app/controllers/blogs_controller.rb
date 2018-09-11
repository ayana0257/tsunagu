class BlogsController < ApplicationController

	def new
		@blog = Blog.new
		@blog.blog_images.build
	end

	def create
		@blog = Blog.new(blog_params)
		# binding.pry
		@blog.save!
		redirect_to blog_path(@blog.id)
	end

	def show
		@blog = Blog.find(params[:id])
		p "--------"
		p @blog.blog_images
		p @blog.blog_images_images
		p "--------"
	end

	def index
		@blogs = Blog.all
		@user = current_user
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		blog = Blog.find(params[:id])
		blog.update!(blog_params)
		redirect_to blog_path(blog.id)
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy!
		redirect_to root_path
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :body, {blog_images_images: []})
	end

end
