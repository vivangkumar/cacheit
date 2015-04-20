require_relative 'base_cache'

module Cache
  class LRUCache < BaseCache
    attr_accessor :size
    attr_accessor :cache
    attr_accessor :length
    attr_accessor :lru

    def initialize(size)
      super(size)
      @lru = []
    end

    def [](key)
      if @cache.has_key?(key)
        age_key(key)
        @cache[key]
      else
        nil
      end
    end

    def []=(key, value)
      @cache[key] = value
      age_key(key)
      @length += 1

      @cache.delete(@lru.pop) if @lru.size > @size
    end

    def delete(key)
      if @cache.has_key?(key)
        @cache.delete(key)
        @lru.delete(key)
        @length -= 1
      end
    end

    def reset
      @cache = {}
      @length = 0
    end

    def keys
      @cache.keys
    end

    def values
      @cache.values
    end

    private

    def age_key(key)
      @lru.unshift(@lru.delete(key) || key)
    end
  end
end