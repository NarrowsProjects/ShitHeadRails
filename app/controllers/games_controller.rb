class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
    @player = @game.players.find_by(name: @game.name)
    puts "Player #{@player.name}"
    @player.face_down_pile.cards.each do |card|
      puts "Card #{card.color} #{card.weight}"

    end

    @face_down_cards = @player.face_down_pile.cards ? @player.face_down_pile.cards : []
    @hand_cards = @player.hand_pile.cards ? @player.hand_pile.cards : []
    @face_up_cards = @player.face_up_pile.cards ? @player.face_up_pile.cards : []

  end

  # GET /games/new
  def new
    @game = Game.new
  end

  def set_face_up
    card = Card.find(params[:card_id])
    face_up_pile = Pile.find_or_create_by(name: 'face_up_pile')
  
    if card.update(pile: face_up_pile)
      render json: { status: 'success', card_id: card.id }, status: :ok
    else
      render json: { status: 'error', message: 'Could not move card.' }, status: :unprocessable_entity
    end
  end


  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    # copying all cards so that the db can be safely emptied after the game.
    cards= Card.all.shuffle.map do |card| card.dup end

    void_pile = Pile.create!
    store_pile = Pile.create!
    game_pile = Pile.create!


    cards.each do |card|
        card.pile  = store_pile
        card.save
    end

    @game.void_pile = void_pile
    @game.store_pile = store_pile
    @game.game_pile = game_pile

    respond_to do |format|
      if @game.save

        #Instantiating all the players to later asign the cards to
        players=[create_player(@game, game_params[:name])]

        game_params[:number_of_players].to_i.times do
          players << create_player(@game, Faker::Name.name)
        end

        #at the start of the game each player will have three cards face-down and six cards in hand.
        players.each do |player|

          # shift both removes the values from the array ensuring that i don't assign the same card to two different things
          cards.shift(3).each do |card|
            puts "fire"
              puts card[:pile_id]
              card.update(pile_id: player.face_down_pile.id)
              puts card[:pile_id]

            puts "fire"
          end

          cards.shift(6).each do |card|
            puts card[:pile_id]

          card.update(pile_id: player.hand_pile.id)
          puts card[:pile_id]

          end
        end

        # so as it turns out the .save method doesn't immediately provide the object with an id and thus it can't be
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
