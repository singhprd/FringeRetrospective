module FringeTimeHelper
  def fringe_time_date(performance)
    time = Time.parse performance.start_time
    time.strftime("%A #{time.day.ordinalize} %B")
  end

  def fringe_start_time(performance)
    time = Time.parse performance.start_time
    time.strftime("%H:%M")
  end

  def fringe_end_time(performance)
    time = Time.parse performance.end_time
    time.strftime("%H:%M")
  end
end
