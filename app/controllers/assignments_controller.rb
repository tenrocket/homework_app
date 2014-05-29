class AssignmentsController < ApplicationController
	def new
		@new_assignment = Assignment.new
	end

	def create
		@new_assignment = Assignment.new(assignment_params)
		if @new_assignment.save
			redirect_to assignments_path
		else 
			refirect_to new_assignment_path, notice: "your assignment has failed to be posted"
		end
	end

	def index
		
		@assignments = Assignment.all
	end

 	def edit
 		@assignment = Assignment.find(params[:id])
 	end

 	def update
 		@assignment = Assignment.find(params[:id])
 		if @assignment.update_attributes(assignment_params)
 			redirect_to assignments_path
 		else 
 			render edit_assignment_path
 		end
 	end

 	private

 	def assignment_params
 		params.require(:assignment).permit!
 	end

end