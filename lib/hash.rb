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
      if value.is_a?(Hash)
        value.deep_transform_keys!(&block)
      elsif value.is_a?(Enumerable)
        value.each { |element|
          element.deep_transform_keys!(&block) if element.is_a?(Hash)
        }
      end
    }
  end

  def deep_symbolize_keys!
    deep_transform_keys!(&:to_sym)
  end
end
