class JudgeRegistrationsController < ApplicationController
  def create
    @judge = current_user.as_judge
    @tournament = Tournament.find(params[:tournament_id])
    @judge_registration = JudgeRegistration.new(params[:judge_registration])
    @judge_registration.judge = @judge
    @judge_registration.tournament = @tournament
    respond_to do |format|
      if @judge_registration.save
        @judge_registration.update_attributes(params[:judge_registration])
        format.html { redirect_to @tournament, notice: 'You successfully registered to judge in the ' + @judge_registration.division + ' division of this tournament!' }
        format.json { render json: @judge_registration, status: :created, location: @tournament }
      else
        format.html { redirect_to @tournament }
        format.json { render json: @judge_registration.errors, status: :unprocessable_entity }
      end
    end    
  end

  def destroy
    @tournament = Tournament.find(params[:tournament_id])
    @judge_registration = current_user.as_judge_registration(@tournament)
    @judge_registration.destroy
    redirect_to tournament_path(@tournament), notice: 'You successfully canceled your registration.'    
  end
end
