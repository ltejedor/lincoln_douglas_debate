class CasesController < ApplicationController
	before_filter :find_resolution
	before_filter :find_case, :only => [:show, :edit, :update, :destroy]

	def new
		@case = @resolution.cases.build
	end

	def create
		@case = @resolution.cases.build(params[:case])
		if @case.save
			flash[:notice] = "Case has been created."
			redirect_to [@resolution, @case]
		else
			flash[:alert] = "Case has not been created"
			render :action => "new"
		end
	end

	def show

	end

private
	def find_resolution
		@resolution = Resolution.find(params[:resolution_id])
	end

	def find_case
		@case = @resolution.cases.find(params[:id])
	end
end