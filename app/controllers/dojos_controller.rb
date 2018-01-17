class DojosController < ApplicationController

def index
    @dojos = Dojo.all
end

def new
end

def show
    @dojos = Dojo.find(params[:id])
    @students = Student.joins(:dojo).where("dojos.id=?",params[:id]).select("first_name, last_name, email, city, state, street,branch, students.id as s_id, dojos.id as dojo_id")
end

def create
    student = Student.new(params[:id])
    dojo = Dojo.new(dojo_params)
    if dojo.save
        flash[:success] = "You have successfully created a new Dojo!"
    else
        flash[:errors] = dojo.errors.full_messages
        redirect_to :back
    end
end

def edit
    @dojos = Dojo.find(params[:id])
end

def update
    dojo = Dojo.find(params[:id])
    if dojo.update(dojo_params)
        flash[:success] = "You have successfully updated the Dojo!"
        redirect_to :back
    else
        flash[:errors] = dojo.errors.full_messages
        redirect_to :back
    end
end

def destroy
    @dojos = Dojo.find(params[:id])
    @dojos.destroy
    redirect_to "/dojos"
end

private
def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
end

end