# Class must define `description`, `total_value_at_date`, `start_date`, and
# `percent_at_date`.
#
module Graphable

  DEFAULT_PERIOD = { months: 1 }.freeze

  def dates(period = DEFAULT_PERIOD.dup)
    DateRange.at(start_date..Date.today).every(period)
  end

  def data(period = DEFAULT_PERIOD.dup)
    dates(period).each_with_object({}) { |d, h| h[d] = total_value_at_date(d) }
  end

  def percent_data(period = DEFAULT_PERIOD.dup)
    dates(period).each_with_object({}) { |d, h| h[d] = percent_at_date(d) * 100 }
  end

  def value_graph(period = DEFAULT_PERIOD.dup)
    { name: description, data: data(period) }
  end

  def percent_graph(period = DEFAULT_PERIOD.dup)
    { name: description, data: percent_data(period) }
  end

  def graph_info(period = DEFAULT_PERIOD.dup)
    if _options_from_user.show_percent_graphs
      percent_graph(period)
    else
      value_graph(period)
    end
  end

end
