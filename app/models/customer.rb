class Customer < ApplicationRecord

  include Graphable

  has_many :comp_arrays
  has_many :components, through: :comp_arrays

  alias_attribute :description, :name

  def start_date
    comp_arrays.minimum(:install_date) || Date.today
  end

  def total_value_at_date(date)
    comp_arrays.inject(0) { |n, ca| n + ca.total_value_at_date(date) }
  end

  def flagged?
    comp_arrays.any?(&:flagged?)
  end

  def flagged_reason
    "Depreciating soon: #{
      comp_arrays.select(&:flagged?).map(&:serial_number).to_sentence}"
  end

  def total_initial_value_at_date(date)
    comp_arrays.map { |ca| ca.total_initial_value_at_date(date) }.sum
  end

  def percent_at_date(date)
    total_value_at_date(date) / total_initial_value_at_date(date).to_f
  end

  def depreciated_or_flagged?
    flagged?
  end

  def depreciated?
    false
  end

  def other_reason
    ''
  end

end
