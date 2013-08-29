class TournamentsController < ApplicationController
  before_filter :find_tournament, :only => [:show, :update]
  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.upcoming
    @tournaments.sort! {|a,b| a.starttime <=> b.starttime }  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournaments }
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    default_image = "https://cdn2.iconfinder.com/data/icons/huge-basic-vector-icons-part-3-3/512/awards_award_star_gold_medal-512.png"
    @image = (@tournament.asset.url if @tournament.asset.url != "/assets/original/missing.png") || @tournament.asset_url || default_image

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament }
    end
  end

  # GET /tournaments/new
  # GET /tournaments/new.json
  def new
    @tournament = Tournament.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament }
    end
  end

  # GET /tournaments/1/edit
  def edit
    @tournament = Tournament.find(params[:id])
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(params[:tournament])
    @tournament.organizer = current_user.as_organizer 

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created by organizer ' + @tournament.organizer.user.name }
        format.json { render json: @tournament, status: :created, location: @tournament }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournaments/1
  # PUT /tournaments/1.json
  def update

    respond_to do |format|
      if @tournament.update_attributes(params[:tournament])
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end
  
  private
  def find_tournament
    @tournament = Tournament.find(params[:id])
  end
end
