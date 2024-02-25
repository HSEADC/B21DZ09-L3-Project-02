class Api::V1::CommentsController < Api::V1::ApplicationController
    # GET /comments or /comments.json
    def index
        @comments = Comment.all

        render json: @comments
    end

    # GET /comments/1 or /comments/1.json
    def show
    end

    def create

        @user = User.find_by_jti(decrypt_payload[0]['jti'])
        @comment = @user.comments.new(comment_params)
  
        if @comment.save
          render json: @comment.as_json
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
  
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, :current_user.id)
        end
end
