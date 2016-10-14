class CompArray < ApplicationRecord
  include Depreciable
  has_many :components
  belongs_to :customer

  DEFAULT_PERIOD = { days: 1 }.freeze

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

  def dates(period = DEFAULT_PERIOD.dup)
    DateRange.at(install_date..Date.today).every(period)
  end

  def data(period = DEFAULT_PERIOD.dup)
    dates(period).each_with_object({}) { |d, h| h[d] = total_value_at_date(d) }
  end

  def stuff(period = DEFAULT_PERIOD.dup)
    { name: description, data: data(period) }
  end
end
