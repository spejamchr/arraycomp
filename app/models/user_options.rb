class UserOptions
  include ActiveModel::Model

  attr_reader :flag_at_months

  def flag_at_months= n
    @flag_at_months = n.to_f
  end

end
