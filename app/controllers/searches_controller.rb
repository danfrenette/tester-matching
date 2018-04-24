class SearchesController < ApplicationController
  def new
    load_form_variables
  end

  def create
    @search_results = Search.new(search_params).results_grouped_by_tester
    load_form_variables
    render :new
  end

  private

  def search_params
    params.require(:search).permit(countries: [], device_ids: [])
  end

  def load_form_variables
    @search = Search.new
    @countries = Tester.distinct.pluck(:country)
    @devices = Device.all
  end
end
