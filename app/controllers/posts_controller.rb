class PostsController < ApplicationController

	def index

		@posts = Post.all

	end

	def new

		@post = Post.new
		@usuarios = Usuario.all

	end

	def create

		if Usuario.exists?(params[:post].permit(:usuario_id)["usuario_id"])
			@usuario = Usuario.find(params[:post].permit(:usuario_id)["usuario_id"])
			@post = @usuario.posts.create(params[:post].permit(:titulo, :mensaje))
			redirect_to posts_path
		else
			redirect_to posts_path
		end

	end

	def show

		@post = Post.find(params[:id])
		@usuarios = Usuario.all

	end

	def destroy

		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path

	end

end
