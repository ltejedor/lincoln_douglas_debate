class ResolutionsController < ApplicationController

	def index
		@resolutions = Resolution.all
	end

	def new
		@resolution = Resolution.new
	end

	def create
		@resolution = Resolution.new(params[:resolution])
			if @resolution.save
				flash[:notice] = "Resolution has been created."
				redirect_to resolutions_path
			else
				flash[:alert] = "Resolution has not been added."
				render :action => "new"
			end
		end

	def show
		@resolution = Resolution.find(params[:id])
	end

	def edit
		@resolution = Resolution.find(params[:id])
	end

	def update
		@resolution = Resolution.find(params[:id])
		if @resolution.update_attributes(params[:resolution])
			flash[:notice] = "Resolution has been updated."
			redirect_to resolutions_path
		else
			flash[:alert] = "Resolution has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		@resolution = Resolution.find(params[:id])
		@resolution.destroy
		flash[:notice] = "Resolution has been deleted."
		redirect_to resolutions_path
	end

end
