#some comment
class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def -(other)
    self.minutes -= other
    compute_minutes
    self
  end

  def +(other)
    self.minutes += other
    compute_minutes
    self
  end

  def ==(other)
    self.hours == other.hours && self.minutes == other.minutes
  end

  def to_s
    "#{sprintf("%02d", hours)}:#{sprintf("%02d", minutes)}"
  end

  private

  attr_writer :hours, :minutes

  def compute_minutes
    hrs, self.minutes = self.minutes.divmod(MINUTES_IN_HOUR)
    self.hours += hrs
    self.hours = HOURS_IN_DAY + self.hours if self.hours.negative?
    self.hours = self.hours % HOURS_IN_DAY
  end
end
