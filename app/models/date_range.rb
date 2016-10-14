# Create an array of evenly spaced dates
#
# Source:
# http://stackoverflow.com/questions/19093487/ruby-create-range-of-dates#answer-19346914
#
# Example:
#   $> DateRange.at(2.months.ago..Date.today).every(months: 1)
#   # => [Sat, 13 Aug 2016, Tue, 13 Sep 2016, Thu, 13 Oct 2016]
class DateRange < Range
  def self.at(range)
    new(range.begin, range.end, range.exclude_end?)
  end

  # step is similar to DateTime#advance argument
  def every(step)
    c_time = self.begin.to_datetime
    finish_time = self.end.to_datetime.end_of_day
    f_compare = exclude_end? ? :< : :<=

    arr = []
    while c_time.send(f_compare, finish_time)
      arr << c_time.to_date
      c_time = c_time.advance(step)
    end
    arr
  end
end
