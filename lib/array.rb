class Array
  def sentence(joiner = 'and', &map_block)
    list = map_block ? map(&map_block) : self

    return list.first.to_s if list.length <= 1

    return "#{list[...-1].join(', ')} #{joiner} #{list.last}"
  end
end
