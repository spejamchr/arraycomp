# Class must define `install_date`, `initial_value`, `flagged?`,
# and `flagged_reason`
#
module Depreciable
  DEPRECIATION_TIME = 36 # In months
  DEFAULT_FLAG_AT_MONTHS = 3 # Flag when depreciating in 3 months

  def flag_at_months
    _options_from_user.flag_at_months
  end

  def near_depreciation
    Date.today > install_date + (DEPRECIATION_TIME - flag_at_months).months &&
      !depreciated?
  end

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

  def flagged?
    raise '`flagged?` should be re-implemented on the model'
  end

  def flagged_reason
    raise '`flagged_reason` should be re-implemented on the model'
  end

  def other_reason
    ''
  end

  def depreciated?
    Date.today > install_date + DEPRECIATION_TIME.months
  end

  def depreciated_or_flagged?
    depreciated? || flagged?
  end

end
