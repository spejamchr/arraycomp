class ChartsController < ApplicationController
  def all_comp_arrays
    render json: CompArray.all.map(&:graph_info).chart_json
  end
end
