class CommentsController < ApplicationController


	def new

		@comment = Comment.new

	end
	def create

		@post = Post.find(params[:post_id])
		if Usuario.exists?(params[:comment].permit(:usuario_id)["usuario_id"])
			@usuario = Usuario.find(params[:comment].permit(:usuario_id)["usuario_id"])
			@comment = @post.comments.create(params[:comment].permit(:titulo, :mensaje, :usuario_id))
			redirect_to posts_path
		else
			redirect_to posts_path
		end


	end

end
