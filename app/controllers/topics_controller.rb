class TopicsController < ApplicationController

	def index
		@topics = Topic.all
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(params[:topic])
		if @topic.save
			flash[:notice] = "Debate Topic has been added."
			redirect_to @topic
		else
			flash[:alert] = "Debate Topic has not been added."
			render :action => "new"
		end
	end

	def show
		@topic = Topic.find(params[:id])
	end

end
