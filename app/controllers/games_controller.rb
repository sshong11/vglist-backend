class GamesController < ApplicationController
  before_action :authorized, except: [:allgames, :show]
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.where(user_id: @user.id)

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    @game.user = @user

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  def allgames
    @games = Game.all

    render json: @games
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :image, :score, :genre, :notes, :date, :submitter)
    end
end
