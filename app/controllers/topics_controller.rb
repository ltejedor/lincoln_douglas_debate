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
			flash[:notice] = "Card has been added."
			redirect_to topics_path
		else
			flash[:alert] = "Card has not been added."
			render :action => "new"
		end
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update_attributes(params[:topic])
			flash[:notice] = "Card has been updated."
			redirect_to topics_path
		else
			flash[:alert] = "Card has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		flash[:notice] = "Card has been deleted."
		redirect_to topics_path
	end

end
