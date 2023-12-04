class Api::V1::PostsController < Api::V1::ApplicationController
  
    # GET /posts or /posts.json
    def index
      @posts = Post.all
    end
  
    # GET /posts/1 or /posts/1.json
    def show
      @artist = Artist.find(params[:artist_id])
      @issue = Issue.find(params[:issue_id])
    end
  
  end
  