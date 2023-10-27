class Admin::IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /issues or /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1 or /issues/1.json
  def show
    @artist = Artist.find(params[:artist_id])
  end

  # GET /issues/new
  def new
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
    @artist = @issue.artist
  end

  # POST /issues or /issues.json
  def create
    @artist = Artist.find(params[:artist_id])
    @issue = Issue.new(name:params[:issue][:name], description: params[:issue][:description], post_image: params[:issue][:post_image], artist_id: @artist.id, user_id: current_user.id)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to admin_artist_url(@artist), notice: "Issue was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    @artist = Artist.find(params[:artist_id])
    
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to admin_artist_issue_url(@artist, @issue), notice: "Issue was successfully updated." }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @artist = Artist.find(params[:artist_id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to admin_artist_url(@artist), notice: "Issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:name, :description, :artist_id, :post_image).merge(user_id: current_user.id)
    end
end
