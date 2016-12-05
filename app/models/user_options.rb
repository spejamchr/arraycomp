class UserOptions
  include ActiveModel::Model

  attr_reader :flag_at_months, :show_percent_graphs

  DEFAULTS = {
    flag_at_months: 3,
    show_percent_graphs: false
  }

  def attributes
    {
      flag_at_months: flag_at_months,
      show_percent_graphs: show_percent_graphs
    }
  end

  def flag_at_months= n
    @flag_at_months = n.to_i
  end

  def show_percent_graphs= n
    @show_percent_graphs = n == '1' || n == true
  end

end
