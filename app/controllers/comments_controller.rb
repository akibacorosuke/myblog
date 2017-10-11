class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post.comments.create(comment_params)
		#記事に紐づいた形でコメントを作る、いきなり記事の詳細にいくのでcomment.createとする
		redirect_to post_path(@post)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
		#requireでcommentをチェック、permitでbodyを許可
	end
end
