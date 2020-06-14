class String
  VOWELS = %w[a e i o u y].freeze
  private_constant :VOWELS

  def vowel?
    each_char { |char| return false unless VOWELS.include?(char) }
    return true
  end

  def pluralize(amount = 2)
    return self if amount == 1 || empty?

    return "#{self}s" if length == 1 || self[-1] != 'y' || self[-2].vowel?

    return "#{self[...-1]}ies"
  end
end
