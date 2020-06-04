module JubiSingleton
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @instance = false
    def instance(*args, &block)
      return @instance if @instance

      @instance = new(*args, &block)
      return @instance
    end

    private

    def method_missing(method, *args, &block)
      return instance.send(method, *args, &block)
    end
  end
end
