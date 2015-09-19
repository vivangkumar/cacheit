require_relative 'base_cache'

module Cache

  # Discards the least recently used items first. 
  # This algorithm requires keeping track of what was used when, 
  # which is expensive if one wants to make sure the algorithm 
  # always discards the least recently used item.
  class LRUCache < BaseCache
    attr_reader :size, :cache

    def initialize(size)
      super(size)
      @lru = []
    end

    def [](key)
      if @cache.has_key?(key)
        age_key(key)
        @cache[key]
      end
    end

    def []=(key, value)
      @cache.delete(@lru.pop) if @lru.size >= @size
      super
      age_key(key)
    end

    def delete(key)
      super
      @lru.delete(key)
    end

    def reset
      super
      @lru = []
    end

    private

    def age_key(key)
      @lru.unshift(@lru.delete(key) || key)
    end
  end
end