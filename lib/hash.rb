class Hash
  def deep_transform_keys!(&block)
    transform_keys!(&block)
    values.deep_transform_keys!(&block)
    return self
  end

  def symbolize_keys
    return transform_keys(&:to_sym)
  end

  def symbolize_keys!
    transform_keys!(&:to_sym)
    return self
  end
end
