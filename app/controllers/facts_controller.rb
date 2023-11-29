class FactsController < ApplicationController
  def index
    matching_facts = Fact.all

    @list_of_facts = matching_facts.order({ :created_at => :desc })

    render({ :template => "facts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_facts = Fact.where({ :id => the_id })

    @the_fact = matching_facts.at(0)

    render({ :template => "facts/show" })
  end

  def create
    the_fact = Fact.new
    the_fact.animal_id = params.fetch("query_animal_id")
    the_fact.fun_fact = params.fetch("query_fun_fact")

    if the_fact.valid?
      the_fact.save
      redirect_to("/facts", { :notice => "Fact created successfully." })
    else
      redirect_to("/facts", { :alert => the_fact.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_fact = Fact.where({ :id => the_id }).at(0)

    the_fact.animal_id = params.fetch("query_animal_id")
    the_fact.fun_fact = params.fetch("query_fun_fact")

    if the_fact.valid?
      the_fact.save
      redirect_to("/facts/#{the_fact.id}", { :notice => "Fact updated successfully."} )
    else
      redirect_to("/facts/#{the_fact.id}", { :alert => the_fact.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fact = Fact.where({ :id => the_id }).at(0)

    the_fact.destroy

    redirect_to("/facts", { :notice => "Fact deleted successfully."} )
  end
end
