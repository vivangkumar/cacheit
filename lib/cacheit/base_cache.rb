module Cache
  attr_accessor :cache

  class BaseCache
    def initialize(capacity)
      @capacity = capacity
      @cache = {}
    end

    def get(key)
      raise "Method 'get' not implemented"
    end

    def set(key, value)
      raise "Method 'set' not implemented"
    end

    def reset()
      raise "Method 'reset' not implemented"
    end
  end
end