# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :check_for_access, except: [:index, :new, :create]

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @events = @list.events
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit; end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.owner = current_user
    @list.users << current_user

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    if params[:add_user] == "true" || params[:remove_user] == "true"
      subject = User.find(params[:user_id])
      @list.add_user(subject, current_user) if params[:add_user] && !@list.users.include?(subject)
      @list.remove_user(subject, current_user) if params[:remove_user] && @list.owner == current_user

      respond_to do |format|
        format.html { redirect_to action: "show", notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      end
      return
    end

    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to action: "index", notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def swap_items
    list = List.find(params[:listId].to_i)
    list_item = list.list_items.find_by_position(params[:oldIndex].to_i)
    list_item.insert_at(params[:newIndex].to_i)
    render json: { success: true }, status: 200
  end

  def create_item
    puts(params[:list_id], params[:event_id])
    @list_item = ListItem.new(list_id: params[:list_id], event_id: params[:event_id])
    @list_item.save!
    # @list_item.save!
    render json: @list_item.to_json, status: 200
  end

  def destroy_item
    puts(params[:list_id], params[:event_id])
    @list_item = List.find(params[:list_id]).list_items.find_by_event_id(params[:event_id])
    render json: @list_item.destroy, status: 200
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:user_id, :name, :year)
  end

  def list_swap_params
    params.permit(:oldIndex, :newIndex, :listId)
  end

  def check_for_access
    if !@list.users.include?(current_user)
      redirect_to lists_path
    end
  end
end
