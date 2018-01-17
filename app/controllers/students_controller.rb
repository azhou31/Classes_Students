class StudentsController < ApplicationController

def index
    @students = Student.all
end

def new
    @students = Student.find(params[:dojo_id])
end

def edit
    @student = Student.find(params[:id])
    @dojos = Dojo.all
end

def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
        flash[:success] = "You have successfully updated this student!"
        redirect_to :back
    else
        flash[:errors] = @student.errors.full_messages
        redirect_to :back
    end
end

def create
    student = Student.new(student_params)
    if student.save
        flash[:success] = "You have successfully added a new student!"
        redirect_to :back
    else
        flash[:errors] = student.errors.full_messages
        redirect_to :back
    end
end

def show
    @dojos = Dojo.find(params[:dojo_id])
    @students = Student.find(params[:id])
    @cohort = Student.cohort(@students)
end

private
    def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end

end