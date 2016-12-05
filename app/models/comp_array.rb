class CompArray < ApplicationRecord

  include Depreciable
  include Graphable

  has_many :components
  belongs_to :customer

  alias_attribute :start_date, :install_date

  def value_of_components_at_date(date)
    components.inject(0) { |a, e| a + e.value_at_date(date) }
  end

  def current_value_of_components
    value_of_components_at_date(Date.today)
  end

  def total_value_at_date(date)
    value_at_date(date) + value_of_components_at_date(date)
  end

  def total_current_value
    total_value_at_date(Date.today)
  end

  def flagged?
    current_value / initial_value.to_f < FLAGGED_RATIO ||
    components.any?(&:flagged?)
  end

end
