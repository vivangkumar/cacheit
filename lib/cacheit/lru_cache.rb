require_relative 'base_cache'

module Cache
  class LRUCache < BaseCache
    attr_accessor :capacity
    attr_accessor :cache
    attr_accessor :length
    attr_accessor :lru

    def initialize(capacity)
      super(capacity)
      @lru = {}
      @usage = 0
    end

    def get(key)
      if @cache.has_key?(key)
        @lru[key] = @usage
        @usage += 1
        @cache[key]
      else
        nil
      end
    end

    def set(key, value)
      if @length >= @capacity
        old_key = @lru.min_by{ |_, v| v }.first
        @cache.delete(old_key)
        @lru.delete(old_key)
      end

      @cache[key] = value
      @lru[key] = @usage
      @usage += 1
      @length += 1
    end

    def delete(key)
      if @cache.has_key?(key)
        @cache.delete(key)
        @lru.delete(key)
        @length -= 1
      end
    end

    def reset
      @lru = {}
      @usage = 0
      @cache = {}
      @length = 0
    end
  end
end