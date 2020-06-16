class Hash
  def deep_transform_keys!(&block)
    transform_keys!(&block)
    values.deep_transform_keys!(&block)
    self
  end

  def symbolize_keys
    transform_keys(&:to_sym)
  end

  def symbolize_keys!
    transform_keys!(&:to_sym)
  end
end
