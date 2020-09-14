# frozen_string_literal: true

class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[show edit update destroy]

  # GET /favourites
  # GET /favourites.json
  def index
    @favourites = Favourite.all
  end

  # GET /favourites/1
  # GET /favourites/1.json
  def show; end

  # GET /favourites/new
  def new
    @favourite = Favourite.new
  end

  # GET /favourites/1/edit
  def edit; end

  # POST /favourites
  # POST /favourites.json
  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.user = current_user

    respond_to do |format|
      if @favourite.save
        format.json { render json: { notice: "Event added to favourites." } }
      else
        format.html { render :new }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourites/1
  # PATCH/PUT /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        # FIXME: Possible unprotected redirect
        format.html do
          redirect_to @favourite, notice: "Favourite was successfully updated."
        end
        format.json { render :show, status: :ok, location: @favourite }
      else
        format.html { render :edit }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    if @favourite.destroy
      render plain: "OK", status: :ok
    else
      format.json { render json: @favourite.errors, status: :unprocessable_entity }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favourite
    @favourite = Favourite.easy_find(event_id: favourite_params[:event_id], user_id: current_user.id)
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def favourite_params
    params.require(:favourite).permit(:user_id, :event_id)
  end
end
