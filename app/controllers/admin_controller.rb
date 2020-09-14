# frozen_string_literal: true

class AdminController < ApplicationController
  # GET /
  def panel
    @events = Event.all.order(score: :desc).page(params[:page]).per(5)
  end
end
