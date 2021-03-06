class ClassyClassesController < ApplicationController

	def new
		@classy = ClassyClass.new
	end

	def create

		ClassyClass.where(belongs_to_user: current_user.id).each do |classy|
			if classy.block == params[:classy_class]["block"]
				classy.destroy
			end
		end

		@classy = ClassyClass.create(params[:classy_class])
		@classy.duration = 60
		@classy.belongs_to_user = current_user.id
		
		if @classy.save
			flash[:success] = "Class added. <a href='#{url_for(add_classes_path)}'>Add another?</a>".html_safe
			redirect_to my_schedule_path
		else
			render 'new'
		end
		
	end

end
