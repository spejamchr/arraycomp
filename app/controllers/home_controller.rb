class HomeController < ApplicationController
  def index
    @components = Component.all.select(&:depreciated_or_flagged?)
    @comp_arrays = CompArray.all.select(&:depreciated_or_flagged?)
    @customers = Customer.all.select(&:depreciated_or_flagged?)
  end
end
