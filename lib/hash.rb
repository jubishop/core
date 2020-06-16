class Hash
  def symbolize_keys
    transform_keys(&:to_sym)
  end

  def symbolize_keys!
    transform_keys!(&:to_sym)
  end

  def deep_transform_keys!(&block)
    transform_keys!(&block)
    values.each { |value|
      value.deep_transform_keys!(&block) if value.is_a?(Hash)
    }
  end

  def deep_symbolize_keys!
    deep_transform_keys!(&:to_sym)
  end
end
