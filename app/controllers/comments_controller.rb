# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :check_permissions, only: %i[edit update destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show; end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  # POST /comments.json
  def create
    # TODO: add in_reply_to
    # in_reply_to = comment_params[:in_reply_to]
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @comment.save!

    render json: { "valid" => @comment.valid? }, status: 200

    # respond_to do |format|
    #   if @comment.valid?
    #       render json: {cat: "dog"}, status: 200
    #   else
    #     render json: {cat: "dog"}, status: 422
    #   end
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render json: @comment, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.permit(:event_id, :text, :in_reply_to)
    # params.fetch(:comment, {})
  end

  def check_permissions
    unless @comment.user == current_user || current_user.try(:admin?)
      raise "You are not permitted to edit this comment!"
    end
  end
end
