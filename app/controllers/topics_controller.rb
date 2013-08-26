class TopicsController < ApplicationController

	def index

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
# nothing, yet
		end
	end

	def show
		@topic = Topic.find(params[:id])
	end

end
