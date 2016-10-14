# Class must define `install_date` and `initial_value`
#
module Depreciable
  DEPRECIATION_TIME = 36 # In months

  def value_at_date(date)
    age_in_months = (date - install_date).to_f / 30
    fraction_remaining = (DEPRECIATION_TIME - age_in_months) / DEPRECIATION_TIME

    # No value before install date
    fraction_remaining = 0 if date < install_date
    [fraction_remaining * initial_value, 0].max
  end

  def current_value
    value_at_date(Date.today)
  end
end
