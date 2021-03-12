module JubiSingleton
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    @instance = false
    def instance(...)
      return @instance if @instance

      @instance = new(...)
      return @instance
    end

    private

    def method_missing(method, *args, &block)
      if instance.respond_to?(method)
        return instance.public_send(method, *args, &block)
      end

      return super
    end

    def respond_to_missing?(method, include_private = false)
      return instance.respond_to?(method, include_private) || super
    end
  end
end
