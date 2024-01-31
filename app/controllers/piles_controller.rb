class PilesController < ApplicationController
  before_action :set_pile, only: %i[ show edit update destroy ]

  # GET /piles or /piles.json
  def index
    @piles = Pile.all
  end

  # GET /piles/1 or /piles/1.json
  def show
  end

  # GET /piles/new
  def new
    @pile = Pile.new
  end

  # GET /piles/1/edit
  def edit
  end

  # POST /piles or /piles.json
  def create
    @pile = Pile.new(pile_params)
      if @pile.save
        head :created
        @pile
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pile.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /piles/1 or /piles/1.json
  def update
    respond_to do |format|
      if @pile.update(pile_params)
        format.html { redirect_to pile_url(@pile), notice: "Pile was successfully updated." }
        format.json { render :show, status: :ok, location: @pile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /piles/1 or /piles/1.json
  def destroy
    @pile.destroy!

    respond_to do |format|
      format.html { redirect_to piles_url, notice: "Pile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pile
      @pile = Pile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pile_params
      params.fetch(:pile, {})
    end
end
