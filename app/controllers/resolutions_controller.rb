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

end
