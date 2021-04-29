class String
  VOWELS = %w[a e i o u y].freeze
  private_constant :VOWELS

  PLURAL_MAP = { person: 'people' }.freeze
  private_constant :PLURAL_MAP

  def vowel?
    return length == 1 && VOWELS.include?(downcase)
  end
end
