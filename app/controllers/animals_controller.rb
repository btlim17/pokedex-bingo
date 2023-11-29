class AnimalsController < ApplicationController
  def index
    matching_animals = Animal.all

    @list_of_animals = matching_animals.order({ :created_at => :desc })

    render({ :template => "animals/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_animals = Animal.where({ :id => the_id })

    @the_animal = matching_animals.at(0)

    render({ :template => "animals/show" })
  end

  def create
    the_animal = Animal.new
    the_animal.name = params.fetch("query_name")
    the_animal.conservation_status = params.fetch("query_conservation_status")
    the_animal.est_population = params.fetch("query_est_population")

    if the_animal.valid?
      the_animal.save
      redirect_to("/animals", { :notice => "Animal created successfully." })
    else
      redirect_to("/animals", { :alert => the_animal.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_animal = Animal.where({ :id => the_id }).at(0)

    the_animal.name = params.fetch("query_name")
    the_animal.conservation_status = params.fetch("query_conservation_status")
    the_animal.est_population = params.fetch("query_est_population")

    if the_animal.valid?
      the_animal.save
      redirect_to("/animals/#{the_animal.id}", { :notice => "Animal updated successfully."} )
    else
      redirect_to("/animals/#{the_animal.id}", { :alert => the_animal.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_animal = Animal.where({ :id => the_id }).at(0)

    the_animal.destroy

    redirect_to("/animals", { :notice => "Animal deleted successfully."} )
  end
end
