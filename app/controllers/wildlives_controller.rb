class WildlivesController < ApplicationController
  def index
    matching_wildlives = Wildlife.all

    @list_of_wildlives = matching_wildlives.order({ :created_at => :desc })

    render({ :template => "wildlives/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_wildlives = Wildlife.where({ :id => the_id })

    @the_wildlife = matching_wildlives.at(0)

    render({ :template => "wildlives/show" })
  end

  def create
    the_wildlife = Wildlife.new
    the_wildlife.park_id = params.fetch("query_park_id")
    the_wildlife.animal_id = params.fetch("query_animal_id")

    if the_wildlife.valid?
      the_wildlife.save
      redirect_to("/wildlives", { :notice => "Wildlife created successfully." })
    else
      redirect_to("/wildlives", { :alert => the_wildlife.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_wildlife = Wildlife.where({ :id => the_id }).at(0)

    the_wildlife.park_id = params.fetch("query_park_id")
    the_wildlife.animal_id = params.fetch("query_animal_id")

    if the_wildlife.valid?
      the_wildlife.save
      redirect_to("/wildlives/#{the_wildlife.id}", { :notice => "Wildlife updated successfully."} )
    else
      redirect_to("/wildlives/#{the_wildlife.id}", { :alert => the_wildlife.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_wildlife = Wildlife.where({ :id => the_id }).at(0)

    the_wildlife.destroy

    redirect_to("/wildlives", { :notice => "Wildlife deleted successfully."} )
  end
end
