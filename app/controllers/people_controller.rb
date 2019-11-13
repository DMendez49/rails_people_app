class PeopleController < ApplicationController

  def index
    @people = Person.all.order(:first_name)
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end  

  def destroy
    Person.find(params[:id]).destroy
    redirect_to people_path
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(persons_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def create 
    @person = Person.new(persons_params)

    if @person.save
      redirect_to people_path
    else
      render :new
  end
end

private

def persons_params
  params.require(:person).permit(:first_name, :last_name, :age, :hair_color, :eye_color, :alive )
end

end
