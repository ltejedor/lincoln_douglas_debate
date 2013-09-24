class JudgeController < ApplicationController
  def new
    @judge = Judge.new
  end

  def create
    @judge = Judge.new(params[:judge])
    if @judge.save
      redirect_to @judge, notice: 'You successfully created your judging paradigm.'
    end
  end

  def edit
    @judge = Judge.find(params[:id])
  end

  def update
    @judge = Judge.find(params[:id])
    if @judge.update_attributes(params[:judge])
      redirect_to @judge, notice: 'You successfully updated your judging paradigm.'
    else
      render action: 'edit'
    end
  end

  def show
    @judge = Judge.find(params[:id])

  end

  def index
  end
end
