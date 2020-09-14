# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :set_vote, only: %i[show edit update destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show; end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit; end

  # POST /votes
  # POST /votes.json
  def create
    vote_tally = Event.find(params["event_id"]).tally_votes

    if current_user.nil?
      render json: { notice: "Please sign in to vote", votes: vote_tally }
      return
    end
    params["user_id"] = current_user.id
    vote_params = { user_id: params["user_id"], event_id: params["event_id"], value: params["value"] }
    user = User.find(params["user_id"])
    if user.reduce_votes_left
      @vote = Vote.new(vote_params)
      respond_to do |format|
        if @vote.save
          format.json { render json: { votes: vote_tally, notice: "Votes left: #{user.votes_left}", status: :success } }
          # flash.now[:notice]="You cannot edit this Page"
          # flash.now[:alert]="You cannot edit this Page"
          # format.js { render 'shared/flash_message', notice: "abcd"}
        else
          format.html { render :new }
          format.json { render json: @vote.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        # format.html { render :new }
        format.json { render json: { notice: "No Votes Left!" } }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: "Vote was successfully updated." }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: "Vote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    private

  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = Vote.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vote_params
    params.require(:vote).permit(:user_id, :event_id, :value)
  end
  end
