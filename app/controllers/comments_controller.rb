class CommentsController < ApplicationController
    def create
        @artist = Artist.find(params[:artist_id])
        @issue = Issue.find(params[:issue_id])
        @post = Post.find(params[:post_id])
		#@comment = @post.comments.create(params[:comment])
		@comment = @post.comments.create(params[:comment].permit(:commenter, :body))
		redirect_to artist_issue_post_url(@artist, @issue, @post)
	end

    def destroy
        @artist = Artist.find(params[:artist_id])
        @issue = Issue.find(params[:issue_id])
        @post = Post.find(params[:post_id])
		#@comment = @post.comments.create(params[:comment])
		@comment.destroy
		redirect_to artist_issue_post_url(@artist, @issue, @post)
	end
end
