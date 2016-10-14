class ChartsController < ApplicationController
  def comp_arrays
    a = CompArray.find(6)
    CompArray.all.map(:dates)
    dates = DateRange.at(a.install_date..Date.today).every(months: 1)
  end
end
