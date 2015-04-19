module Cache
  attr_accessor :cache
  attr_accessor :length
  
  class BaseCache
    def initialize(capacity)
      @capacity = capacity
      @cache = {}
      @length = 0
    end

    def get(key)
    end

    def set(key, value)
    end

    def delete(key)
    end

    def reset()
    end
  end
end