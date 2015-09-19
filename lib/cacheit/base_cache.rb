module Cache
  attr_accessor :cache, :length
  
  class BaseCache
    def initialize(size)
      @size = size
      @cache = {}
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

    protected

    def [](key)
    end

    def []=(key, value)
    end

    def delete(key)
    end

    def reset
      @cache = {}
      @size = 0
    end
  end
end