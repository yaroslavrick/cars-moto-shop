# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @user_searches = Search.where(user_id: current_user.id)
    @pagy, @user_searches = pagy @user_searches, items: 10
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params.merge(user_id: current_user.id)) if current_user
    redirect_to cars_path(filter_params)
  end

  private

  def search_params
    params.require(:filter_params).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end

  def filter_params
    params.permit(filter_params: {})
  end
end
