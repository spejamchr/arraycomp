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

end
