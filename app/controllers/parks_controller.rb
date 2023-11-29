class ParksController < ApplicationController
  def index
    matching_parks = Park.all

    @list_of_parks = matching_parks.order({ :created_at => :desc })

    render({ :template => "parks/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_parks = Park.where({ :id => the_id })

    @the_park = matching_parks.at(0)

    render({ :template => "parks/show" })
  end

  def create
    the_park = Park.new
    the_park.name = params.fetch("query_name")
    the_park.location = params.fetch("query_location")

    if the_park.valid?
      the_park.save
      redirect_to("/parks", { :notice => "Park created successfully." })
    else
      redirect_to("/parks", { :alert => the_park.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_park = Park.where({ :id => the_id }).at(0)

    the_park.name = params.fetch("query_name")
    the_park.location = params.fetch("query_location")

    if the_park.valid?
      the_park.save
      redirect_to("/parks/#{the_park.id}", { :notice => "Park updated successfully."} )
    else
      redirect_to("/parks/#{the_park.id}", { :alert => the_park.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_park = Park.where({ :id => the_id }).at(0)

    the_park.destroy

    redirect_to("/parks", { :notice => "Park deleted successfully."} )
  end
end
