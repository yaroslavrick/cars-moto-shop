# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_search, only: [:destroy]
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

  def destroy
    # @search = Search.where("id = ?", params[:user_id]).destroy_all
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_path, notice: I18n.t('searches.index.search_was_successfully_destroyed') }
    end
  end

  private

  def search_params
    return false if params['filter_params'].blank?

    params.require(:filter_params).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end

  def filter_params
    params.permit(filter_params: {})
  end

  def set_search
    # @search = Search.find(params[:user_id])
    @search = Search.where(user_id: params[:user_id])
  end
end
