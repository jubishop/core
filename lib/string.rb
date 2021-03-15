class String
  VOWELS = %w[a e i o u y].freeze
  private_constant :VOWELS

  PLURAL_MAP = {
    person: 'people'
  }.freeze
  private_constant :PLURAL_MAP

  def vowel?
    return length == 1 && VOWELS.include?(self)
  end

  def pluralize(amount = 2)
    return self if amount == 1 || empty?

    return "#{self}s" if length == 1

    return PLURAL_MAP.fetch(to_sym) if PLURAL_MAP.key?(to_sym)

    last_char = self[-1] || ''
    second_to_last_char = self[-2] || ''

    return "#{self}es" if last_char == 'o' && !second_to_last_char.vowel?

    if last_char == 'y' && !second_to_last_char.vowel?
      return "#{self[...-1]}ies"
    end

    return "#{self}s"
  end
end
