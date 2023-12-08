class BingoTilesController < ApplicationController
  def index
    matching_bingo_tiles = BingoTile.all

    @list_of_bingo_tiles = matching_bingo_tiles.order({ :created_at => :desc })

    render({ :template => "bingo_tiles/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bingo_tiles = BingoTile.where({ :id => the_id })

    @the_bingo_tile = matching_bingo_tiles.at(0)

    render({ :template => "bingo_tiles/show" })
  end

  def create
    x = 0
    population = (0..28).to_a.sample(24)
    while x < 24 do
    the_bingo_tile = BingoTile.new
    the_bingo_tile.animal_id = population.at(x)
    the_bingo_tile.bingo_board_id = params.fetch("path_id")
    the_bingo_tile.position = x
    the_bingo_tile.solved = false
    the_bingo_tile.save
    x = x + 1
    end
    redirect_to("/bingo_boards/#{the_bingo_tile.bingo_board_id}", { :notice => "Bingo tiles created successfully." })
    # if the_bingo_tile.valid?
    #   the_bingo_tile.save
    #   redirect_to("/bingo_boards/#{the_bingo_tile.bingo_board_id}", { :notice => "Bingo tiles created successfully." })
    # else
    #   redirect_to("/bingo_tiles", { :alert => the_bingo_tile.errors.full_messages.to_sentence })
    # end
  end

  def update
    the_id = params.fetch("path_id")
    the_bingo_tile = BingoTile.where({ :id => the_id }).at(0)
    the_bingo_tile.solved = true
    the_bingo_tile.save
    pp the_bingo_tile.solved

    if the_bingo_tile.valid?
      the_bingo_tile.save
      redirect_to("/bingo_boards/#{the_bingo_tile.bingo_board_id}", { :notice => "Bingo tile updated successfully."} )
    else
      redirect_to("/bingo_boards/#{the_bingo_tile.bingo_board_id}", { :alert => the_bingo_tile.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bingo_tile = BingoTile.where({ :id => the_id }).at(0)

    the_bingo_tile.destroy

    redirect_to("/bingo_tiles", { :notice => "Bingo tile deleted successfully."} )
  end
end
