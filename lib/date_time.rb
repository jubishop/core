require_relative 'duration'

module DateTimeDurationExtensions
  def -(other)
    if other.is_a?(Duration)
      return self - Rational(other.milliseconds / Duration::DAYS)
    end

    super(other)
  end

  def +(other)
    if other.is_a?(Duration)
      return self + Rational(other.milliseconds / Duration::DAYS)
    end

    super(other)
  end
end

class DateTime
  prepend DateTimeDurationExtensions
end
