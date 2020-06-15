require_relative 'duration'

class Numeric
  def milliseconds
    return Duration.new(self, units: Duration::MILLISECONDS)
  end

  def seconds
    return Duration.new(self, units: Duration::SECONDS)
  end

  def minutes
    return Duration.new(self, units: Duration::MINUTES)
  end

  def hours
    return Duration.new(self, units: Duration::HOURS)
  end

  def days
    return Duration.new(self, units: Duration::DAYS)
  end
end
