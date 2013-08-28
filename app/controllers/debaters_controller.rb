class DebatersController < ApplicationController
  def create
    @debater = Debater.where(user_id: current_user.id) || Debater.new
    @debater.update_attributes(params[:debater])
    respond_to do |format|
      if @debater.save
        format.html { redirect_to Tournament.find(params[:debater][:rsvptournament_id]),
           notice: 'You successfully registered to debate' + @debater.level + 'this tournament!' }
        format.json { render json: @debater, status: :created, location: @tournament }
      else
        format.html { render action: "new" }
        format.json { render json: @debater.errors, status: :unprocessable_entity }
      end
    end

    
  end

  def destroy
  end
end
