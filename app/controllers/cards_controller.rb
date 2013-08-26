class CardsController < ApplicationController
	before_filter :find_topic
	before_filter :find_card, :only => [:show, :edit, :update, :destroy]

	def new
		@card = @topic.cards.build
	end

	def create
		@card = @topic.cards.build(params[:card])
		if @card.save
			flash[:notice] = "Evidence Card has been created."
			redirect_to [@topic, @card]
		else
			flash[:alert] = "Evidence Card has not been created."
			render :action => "new"
		end
	end

	def show

	end

	def edit

	end

	def update
		if @card.update_attributes(params[:card])
			flash[:notice] = "Evidence Card has been updated."
			redirect_to [@topic, @card]
		else
			flash[:alert] = "Evidence Card has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		@card.destroy
		flash[:notice] = "Evidence Card has been deleted."
		redirect_to @topic
	end

	private
		def find_topic
			@topic = Topic.find(params[:topic_id])
		end

		def find_card
			@card = @topic.cards.find(params[:id])
		end

end
