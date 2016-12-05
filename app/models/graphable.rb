# Class must define `description`, `total_value_at_date`, and `start_date`
#
module Graphable

  DEFAULT_PERIOD = { months: 1 }.freeze

  def dates(period = DEFAULT_PERIOD.dup)
    DateRange.at(start_date..Date.today).every(period)
  end

  def data(period = DEFAULT_PERIOD.dup)
    dates(period).each_with_object({}) { |d, h| h[d] = total_value_at_date(d) }
  end

  def graph_info(period = DEFAULT_PERIOD.dup)
    { name: description, data: data(period) }
  end

end
