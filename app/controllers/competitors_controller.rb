class CompetitorsController < ApplicationController
  def create
    @debater = current_user.as_debater
    @tournament = Tournament.find(params[:tournament_id])
    @competitor = (Competitor.where(debater_id: @debater.id, tournament_id: @tournament.id).first || Competitor.new(params[:competitor]))
    @competitor.debater = @debater
    @competitor.tournament = @tournament
    respond_to do |format|
      if @competitor.save
        @competitor.update_attributes(params[:competitor])
        format.html { redirect_to @tournament, notice: 'You successfully registered to debate in the ' + @competitor.division + ' division of this tournament!' }
        format.json { render json: @competitor, status: :created, location: @tournament }
      else
        format.html { redirect_to @tournament }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
    
  end
end
