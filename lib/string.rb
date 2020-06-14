class String
  def pluralize(amount = 2)
    return self if amount == 1

    return self[-1] == 'y' ? "#{self[...-1]}ies" : "#{self}s"
  end
end
