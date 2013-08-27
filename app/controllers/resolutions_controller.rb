class ResolutionsController < ApplicationController

	def index
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
				#nothing yet
			end
		end

end
