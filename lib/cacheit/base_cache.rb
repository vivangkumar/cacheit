module Cache
  attr_accessor :cache

  class BaseCache
    def initialize(capacity)
      @capacity = capacity
      @cache = {}
    end

    def get(key)
    end

    def set(key, value)
    end

    def reset()
    end
  end
end