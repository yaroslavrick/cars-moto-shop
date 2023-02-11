# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @user_searches = Search.where(user_id: current_user.id)
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params.merge(user_id: current_user.id)) if current_user
  end

  private

  def search_params
    return false if params['filter_params'].blank?

    # params['filter_params'].permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
    params.require(:filter_params).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end
