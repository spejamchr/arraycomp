class Component < ApplicationRecord

  include Depreciable
  include Graphable

  belongs_to :comp_array

  alias_method :total_value_at_date, :value_at_date
  alias_attribute :start_date, :install_date

  def flagged?
    current_value / initial_value.to_f < FLAGGED_RATIO
  end

end
