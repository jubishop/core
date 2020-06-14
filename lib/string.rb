class String
  include Enumerable

  VOWELS = %w[a e i o u y].freeze
  private_constant :VOWELS

  def each
    return to_enum(:each) unless block_given?

    each_char { |char| yield char }
  end

  def vowel?
    all? { |char| VOWELS.include?(char) }
  end

  def pluralize(amount = 2)
    return self if amount == 1 || empty?

    return "#{self}s" if length == 1 || self[-1] != 'y' || self[-2].vowel?

    return "#{self[...-1]}ies"
  end
end
