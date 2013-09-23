class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new[:feedback]
    if @feedback.save
      redirect_to :back, notice: 'Thank you for your feedback!'
    else
      redirect_to :back, alert: 'Something went wrong with sending your feedback.'
    end
  end
end
