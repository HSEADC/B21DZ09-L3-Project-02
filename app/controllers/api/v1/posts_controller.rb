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

    def create
      puts "======================="
      puts "REQUEST FROM FRONTEND"
      jti  = request.headers["Authorization"]
      puts "======================="

      @user = User.find_by_jti(jti)
      @post = @user.posts.new(post_params)

      if @post.save
        render json: @post.as_json
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    private
      def post_params
        params.require(:post).permit(:name, :description, :body, :issue_id, :post_image)
      end
  
  end
  