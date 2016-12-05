class CompArray < ApplicationRecord

  include Depreciable
  include Graphable
  include ActionView::Helpers::DateHelper # Use time_ago_in_words
  include ActionView::Helpers::TextHelper # Use pluralize

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
    near_depreciation || components.any?(&:flagged?)
  end

  def flagged_reason
    reason = ''
    if near_depreciation
      reason += "Completely depreciates in #{
        time_ago_in_words(start_date + 3.years)}. "
    end
    if components.any?(&:flagged?)
      reason += "#{
        pluralize(components.select(&:flagged?).count, 'component')
        } depreciating soon"
    end
    reason
  end

  def total_initial_value_at_date(date)
    return 0 if date < install_date
    initial_value +
      components.where('install_date <= ?', date).pluck(:initial_value).sum
  end

  def percent_at_date(date)
    total_value_at_date(date) / total_initial_value_at_date(date).to_f
  end

end
