class StuffPeriod
  include FromHash
  attr_accessor :schedule, :user
  fattr(:stuff) { schedule.stuff }
  attr_accessor :start_day, :end_day
  fattr(:existing_days) do
    user.stuff_days.between(start_day,end_day)
  end
  fattr(:all_days) do
    (start_day..end_day).map do |date|
      exist = existing_days.select { |x| x.day == date }.first
      exist || StuffDay.new(:day => date, :user => user, :stuff => stuff, :amount => 0)
    end
  end
  
  class << self
    def current_week_start_day
      res = Date.today
      (0...10).each do |i|
        return res if res.sunday?
        res = res - 1
      end
      raise 'bad'
    end
    def current_week(ops)
      week_starting current_week_start_day,ops
    end
    def last_week(ops)
      week_starting current_week_start_day-7,ops
    end
    def week_starting(start_day,ops)
      days = {:start_day => start_day, :end_day => start_day+6}
      ops = days.merge(ops)
      new(ops)
    end
  end
end
  