class PostsController < ApplicationController

# http_basic_authenticate_with name: "dhh", password: "secret", only: [:update, :destroy]
	def main_splash
		offset = rand(Post.count)
		@highlight_post = Post.offset(offset).first
		render "main_splash.html.erb"
	end

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		# render plain: params[:post].inspect
		@post = Post.new(post_params)

		# Less efficient way of saving. Does not account for user entering empty record
		# @post.save
		# redirect_to @post

		if(@post.save)
			redirect_to @post
		else
			render "new"
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		# Less efficient way of updating. Does not account for user entering empty record
		# @post.update(
		# 	title: params[:title],
		# 	body: params[:body]
		# )


		# redirect_to @post


		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy

	@post = Post.find(params[:id])

	@post.destroy

	redirect_to posts_path

	end

	private def post_params

		params.require(:post).permit(:title, :body)
	end


end
