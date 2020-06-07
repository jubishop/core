class Numeric
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

  def duration(units: SECONDS, precision: SECONDS)
    remaining = Rational(self * units)
    days = (remaining / DAYS).to_i
    remaining -= days * DAYS
    hours = (remaining / HOURS).to_i
    remaining -= hours * HOURS
    minutes = (remaining / MINUTES).to_i
    remaining -= minutes * MINUTES
    seconds = (remaining / SECONDS).to_i
    remaining -= seconds * SECONDS
    milliseconds = (remaining / MILLISECONDS).to_i

    parts = []
    parts.push(pluralize('day', days)) if days >= 1
    parts.push(pluralize('hour', hours)) if hours >= 1 && HOURS >= precision
    if minutes >= 1 && MINUTES >= precision
      parts.push(pluralize('minute', minutes))
    end
    if seconds >= 1 && SECONDS >= precision
      parts.push(pluralize('second', seconds))
    end
    if milliseconds >= 1 && MILLISECONDS >= precision
      parts.push(pluralize('millisecond', milliseconds))
    end

    if parts.empty?
      null_answers = {
        MILLISECONDS => '0 milliseconds',
        SECONDS => '0 seconds',
        MINUTES => '0 minutes',
        HOURS => '0 hours',
        DAYS => '0 days'
      }
      return null_answers.fetch(precision)
    end

    return build_sentence(parts)
  end

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
