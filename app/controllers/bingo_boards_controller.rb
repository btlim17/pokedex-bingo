class BingoBoardsController < ApplicationController
  def index
    matching_bingo_boards = BingoBoard.all

    @list_of_bingo_boards = matching_bingo_boards.order({ :created_at => :desc })

    render({ :template => "bingo_boards/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bingo_boards = BingoBoard.where({ :id => the_id })

    @the_bingo_board = matching_bingo_boards.at(0)

    render({ :template => "bingo_boards/show" })
  end

  def create
    the_bingo_board = BingoBoard.new
    the_bingo_board.user_id = params.fetch("query_user_id")
    the_bingo_board.park_id = params.fetch("query_park_id")

    if the_bingo_board.valid?
      the_bingo_board.save
      redirect_to("/bingo_boards/#{the_bingo_board.id}", { :notice => "Bingo board created successfully." })
    else
      redirect_to("/bingo_boards", { :alert => the_bingo_board.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bingo_board = BingoBoard.where({ :id => the_id }).at(0)

    the_bingo_board.user_id = params.fetch("query_user_id")
    the_bingo_board.park_id = params.fetch("query_park_id")

    if the_bingo_board.valid?
      the_bingo_board.save
      redirect_to("/bingo_boards/#{the_bingo_board.id}", { :notice => "Bingo board updated successfully."} )
    else
      redirect_to("/bingo_boards/#{the_bingo_board.id}", { :alert => the_bingo_board.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bingo_board = BingoBoard.where({ :id => the_id }).at(0)

    the_bingo_board.destroy

    redirect_to("/bingo_boards", { :notice => "Bingo board deleted successfully."} )
  end
end
