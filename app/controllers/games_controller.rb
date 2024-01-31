class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    void_pile = Pile.create!
    store_pile = Pile.create!
    game_pile = Pile.create!

    @game.void_pile = void_pile
    @game.store_pile = store_pile
    @game.game_pile = game_pile

    respond_to do |format|
      if @game.save
        puts "Game created successfully"

        game_params[:number_of_players].to_i.times do
          create_player(@game, Faker::Name.name)
        end

        create_player(@game, game_params[:name])

        #  so as it turns out the .save method doesn't immediately provide the object with an id and thus it can't be
        # set and saved.
        @game.update_columns(void_pile_id: void_pile.id, store_pile_id: store_pile.id, game_pile_id: game_pile.id)

        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :number_of_players)
  end

  def create_player(game, player_name)
    Player.create!(
      name: player_name,
      game: game,
      hand_pile: Pile.create!,
      face_down_pile: Pile.create!,
      face_up_pile: Pile.create!
    )
  end
end
