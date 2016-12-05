class Component < ApplicationRecord

  include Depreciable
  include Graphable
  include ActionView::Helpers::DateHelper # Use time_ago_in_words

  belongs_to :comp_array

  alias_method :total_value_at_date, :value_at_date
  alias_attribute :start_date, :install_date

  def flagged?
    current_value / initial_value.to_f < FLAGGED_RATIO
  end

  def flagged_reason
    "Completely depreciates in #{time_ago_in_words(start_date + 3.years)}."
  end

end
