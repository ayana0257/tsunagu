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
		# @comments = @blog.comments.includes(:user).all
		# @comment = @blog.comments.build(user_id: current_user.id) if curent_user
		# p "--------"
		# p @blog.blog_images
		# p @blog.blog_images_images
		# p "--------"
		@comment = Comment.new
		@comments = @blog.comments
	end

	def comment
    # @comment = Comment.new(comment: params[:comment], blog_id: params[:blog_id], user_id: params[:user_id])
    # @comment.save
    # redirect_to :action => "show", :id => @comment.blog_id

    # @blog = Blog.find(params[:id])
    # @comment = Comment.new(comment_params.merge(blog_id: @blog.id))
    # @comment.save!
    # # redirect_to action: :show
    # redirect_to :action => "show", :id => @comment.blog_id
    # rescue
    # 	render action: :show
    end


	def index
		@blogs = Blog.all
		@user = current_user
		# p "--------"
		# p @blog.blog_images
		# p @blog.blog_images_images
		# p "--------"
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
	# def comment_params
	# 	params.require(:comment).permit(
	# 		:name, :body
	# 	)
	# end

end
