class Api::V1::ArtistsController < Api::V1::ApplicationController

  # GET /artists or /artists.json
  def index
     @artists = Artist.all


    # render :index
    # render json: @artists
  end

  
end
