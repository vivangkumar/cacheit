module Cache
  attr_accessor :cache
  attr_accessor :length
  
  class BaseCache
    def initialize(size)
      @size = size
      @cache = {}
      @length = 0
    end

    def [](key)
    end

    def []=(key, value)
    end

    def delete(key)
    end

    def keys
    end

    def values
    end

    def reset
    end
  end
end