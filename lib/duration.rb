require_relative 'array'
require_relative 'string'

class Duration
  include Comparable

  MILLISECONDS = 1
  SECONDS = MILLISECONDS * 1000
  MINUTES = SECONDS * 60
  HOURS = MINUTES * 60
  DAYS = HOURS * 24
  public_constant :MILLISECONDS
  public_constant :SECONDS
  public_constant :MINUTES
  public_constant :HOURS
  public_constant :DAYS

  TIME_NAMES = {
    DAYS => 'day',
    HOURS => 'hour',
    MINUTES => 'minute',
    SECONDS => 'second',
    MILLISECONDS => 'millisecond'
  }.freeze
  private_constant :TIME_NAMES

  def self.of_milliseconds(milliseconds)
    return Duration.new(milliseconds, Units: MILLISECONDS)
  end

  def self.of_seconds(seconds)
    return Duration.new(seconds, units: SECONDS)
  end

  def self.of_minutes(minutes)
    return Duration.new(minutes, units: MINUTES)
  end

  def self.of_hours(hours)
    return Duration.new(hours, units: HOURS)
  end

  def self.of_days(days)
    return Duration.new(days, units: DAYS)
  end

  attr_reader :milliseconds

  def initialize(amount, units: SECONDS)
    @milliseconds = Rational(amount * units)
  end

  def days
    (milliseconds / DAYS).to_i
  end
  alias d days

  def hours
    (milliseconds / HOURS).to_i
  end
  alias h hours

  def minutes
    (milliseconds / MINUTES).to_i
  end
  alias m minutes

  def seconds
    (milliseconds / SECONDS).to_i
  end
  alias s seconds
  alias ms milliseconds

  def <=>(other)
    milliseconds <=> other.milliseconds
  end

  def +(other)
    unless other.is_a?(Duration)
      raise ArgumentError, "#{other} is not a Duration"
    end

    return Duration.new(milliseconds + other.milliseconds, units: MILLISECONDS)
  end

  def -(other)
    unless other.class == Duration
      raise ArgumentError, "#{other} is not a Duration"
    end
    if other.milliseconds > milliseconds
      raise RangeError, "#{other} is so large the result would be negative"
    end

    return Duration.new(milliseconds - other.milliseconds, units: MILLISECONDS)
  end

  def format(precision = SECONDS)
    remaining = milliseconds
    parts = TIME_NAMES.filter_map { |amount, name|
      next unless amount >= precision

      value = (remaining / amount).to_i
      next unless value.positive?

      remaining -= value * amount
      "#{value} #{name.pluralize(value)}"
    }
    parts.push(TIME_NAMES.fetch(precision).pluralize(0)) if parts.empty?
    return parts.sentence
  end
  alias to_s format
end
