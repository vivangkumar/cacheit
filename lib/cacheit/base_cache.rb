module Cache
  attr_accessor :cache
  attr_accessor :length
  
  class BaseCache
    def initialize(size)
      @size = size
      @cache = {}
    end

    def [](key)
    end

    def []=(key, value)
    end

    def delete(key)
      if @cache.has_key?(key)
        @cache.delete(key)
        @lru.delete(key)
      end
    end

    def keys
      @cache.keys
    end

    def values
      @cache.values
    end

    def length
      @cache.length
    end

    def reset
      @cache = {}
    end
  end
end