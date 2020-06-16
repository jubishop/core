module Enumerable
  def deep_transform_keys!(&block)
    each { |elem| elem.deep_transform_keys!(&block) if elem.is_a?(Enumerable) }
    self
  end

  def deep_symbolize_keys!
    deep_transform_keys!(&:to_sym)
  end
end
