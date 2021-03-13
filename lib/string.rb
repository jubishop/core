class String
  VOWELS = %w[a e i o u y].freeze
  private_constant :VOWELS

  def vowel?
    each_char { |char| return false unless VOWELS.include?(char) }
    return true
  end

  def pluralize(amount = 2)
    return self if amount == 1 || empty?

    return "#{self}s" if length == 1

    last_char = self[-1] || ''
    second_to_last_char = self[-2] || ''
    return "#{self}s" if last_char != 'y' || second_to_last_char.vowel?

    return "#{self[...-1]}ies"
  end
end
