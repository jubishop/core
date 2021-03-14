module Enumerable
  def deep_transform_keys!(&block)
    # @type self: Enumerable[Object]
    each { |elem|
      # @type var elem: untyped
      if elem.is_a?(Enumerable)
        # @type var elem: Enumerable[Object]
        elem.deep_transform_keys!(&block)
      end
    }
    return self
  end

  def deep_symbolize_keys!
    return deep_transform_keys!(&:to_sym)
  end
end
