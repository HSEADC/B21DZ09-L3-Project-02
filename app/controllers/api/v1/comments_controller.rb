class Api::V1::CommentsController < Api::V1::ApplicationController
    # GET /comments or /comments.json
    def index
        @comments = Comment.all

        render json: @comments
    end

    # GET /comments/1 or /comments/1.json
    def show
    end
end
