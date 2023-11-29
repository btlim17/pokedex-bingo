class ConservationCtaController < ApplicationController
  def index
    matching_conservation_cta = ConservationCtum.all

    @list_of_conservation_cta = matching_conservation_cta.order({ :created_at => :desc })

    render({ :template => "conservation_cta/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_conservation_cta = ConservationCtum.where({ :id => the_id })

    @the_conservation_ctum = matching_conservation_cta.at(0)

    render({ :template => "conservation_cta/show" })
  end

  def create
    the_conservation_ctum = ConservationCtum.new
    the_conservation_ctum.name = params.fetch("query_name")
    the_conservation_ctum.animal_id = params.fetch("query_animal_id")
    the_conservation_ctum.url = params.fetch("query_url")

    if the_conservation_ctum.valid?
      the_conservation_ctum.save
      redirect_to("/conservation_cta", { :notice => "Conservation ctum created successfully." })
    else
      redirect_to("/conservation_cta", { :alert => the_conservation_ctum.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_conservation_ctum = ConservationCtum.where({ :id => the_id }).at(0)

    the_conservation_ctum.name = params.fetch("query_name")
    the_conservation_ctum.animal_id = params.fetch("query_animal_id")
    the_conservation_ctum.url = params.fetch("query_url")

    if the_conservation_ctum.valid?
      the_conservation_ctum.save
      redirect_to("/conservation_cta/#{the_conservation_ctum.id}", { :notice => "Conservation ctum updated successfully."} )
    else
      redirect_to("/conservation_cta/#{the_conservation_ctum.id}", { :alert => the_conservation_ctum.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_conservation_ctum = ConservationCtum.where({ :id => the_id }).at(0)

    the_conservation_ctum.destroy

    redirect_to("/conservation_cta", { :notice => "Conservation ctum deleted successfully."} )
  end
end
