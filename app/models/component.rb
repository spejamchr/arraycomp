class Component < ApplicationRecord

  include Depreciable
  include Graphable
  include ActionView::Helpers::DateHelper # Use time_ago_in_words

  belongs_to :comp_array
  has_one :customer, through: :comp_array

  alias_method :total_value_at_date, :value_at_date
  alias_attribute :start_date, :install_date

  def flagged?
    near_depreciation
  end

  def flagged_reason
    "Completely depreciates in #{time_ago_in_words(start_date + 3.years)}."
  end

  def percent_at_date(date)
    value_at_date(date) / initial_value.to_f
  end

end
