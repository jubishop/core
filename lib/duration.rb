class Duration
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

  attr_reader :milliseconds

  def initialize(amount, units: SECONDS)
    @milliseconds = Rational(amount * units)
  end

  def days
    (@milliseconds / DAYS).to_i
  end
  alias d days

  def hours
    (@milliseconds / HOURS).to_i
  end
  alias h hours

  def minutes
    (@milliseconds / MINUTES).to_i
  end
  alias m minutes

  def seconds
    (@milliseconds / SECONDS).to_i
  end
  alias s seconds
  alias ms milliseconds

  def +(other)
    unless other.class == Duration
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
    remaining = @milliseconds
    parts = TIME_NAMES.filter_map { |amount, name|
      value = (remaining / amount).to_i
      remaining -= value * amount
      pluralize(name, value) if value.positive? && amount >= precision
    }
    parts.push(pluralize(TIME_NAMES.fetch(precision), 0)) if parts.empty?
    return build_sentence(parts)
  end
  alias to_s format

  private

  def pluralize(word, value)
    int = value.to_i
    return int == 1 ? "#{int} #{word}" : "#{int} #{word}s"
  end

  def build_sentence(parts)
    raise ArgumentError, 'Sentence must have a part' if parts.empty?

    return parts.first if parts.length == 1

    return parts.join(' and ') if parts.length == 2

    return "#{parts[...-1].join(', ')} and #{parts.last}"
  end
end
