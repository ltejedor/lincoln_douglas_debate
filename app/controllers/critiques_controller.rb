class CritiquesController < ApplicationController
	before_filter :find_resolution
	before_filter :find_case
	before_filter :find_critique, :only => [:show, :edit, :update, :destroy]


	def new
		@critique = @case.critiques.build
	end

	def create
		@critique = @case.critiques.build(params[:critique])
		if @critique.save
			flash[:notice] = "Critique has been created"
			redirect_to [@resolution, @case]
		else
			flash[:alert] = "Critique has not been created"
			render :action => "new"
		end
	end

	def show
	end

	def edit
	end

	def destroy
		@critique.destroy
		flash[:notice] = "Critique has been deleted"
		redirect_to @case
	end

private

	def find_resolution
		@resolution = Resolution.find(params[:resolution_id])
	end

	def find_critique
		@critique = @case.critiques.find(params[:id])
	end

	def find_case
		@case = Case.find(params[:case_id])
	end

end
