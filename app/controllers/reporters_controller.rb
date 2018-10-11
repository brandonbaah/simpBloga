class ReportersController < ApplicationController

	def index
		@reporters = Reporter.all
	end

	def new
		@post = Reporter.new
	end

	def create
		# render plain: params[:post].inspect
		@post = Reporter.new(post_params)

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
		@reporter = Reporter.find(params[:id])
	end

	def edit
		@reporter = Reporter.find(params[:id])
	end

	def update
		@reporter = Reporter.find(params[:id])

		# Less efficient way of updating. Does not account for user entering empty record
		# @post.update(
		# 	title: params[:title],
		# 	body: params[:body]
		# )
		

		# redirect_to @post


		if(@reporter.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy

	@post = Reporter.find(params[:id])
	
	@post.destroy

	redirect_to posts_path	
		
	end

	private def post_params
	
		params.require(:post).permit(:title, :body)
	end


end
