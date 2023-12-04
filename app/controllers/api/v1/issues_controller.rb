class Api::V1::IssuesController < Api::V1::ApplicationController

  # GET /issues or /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1 or /issues/1.json
  def show
    @artist = Artist.find(params[:artist_id])
  end

end

  