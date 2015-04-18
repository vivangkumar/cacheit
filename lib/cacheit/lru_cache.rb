require_relative 'base_cache'

module Cache
  class LRUCache < BaseCache
    attr_accessor :capacity
    attr_accessor :cache
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
      if @cache.length >= @capacity
        old_key = @lru.min_by{ |_, v| v }.first
        @cache.delete(old_key)
        @lru.delete(old_key)
      end

      @cache[key] = value
      @lru[key] = @usage
      @usage += 1
    end

    def reset
      @lru = {}
      @usage = 0
      @cache = {}
    end
  end
end