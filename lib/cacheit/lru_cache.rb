require_relative 'base_cache'

module Cache

  # Discards the least recently used items first. 
  # This algorithm requires keeping track of what was used when, 
  # which is expensive if one wants to make sure the algorithm 
  # always discards the least recently used item.
  class LRUCache < BaseCache
    attr_accessor :size
    attr_accessor :cache
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
      if @lru.size >= @size
        @cache.delete(@lru.pop)
      end
      
      @cache[key] = value
      age_key(key)
    end

    private

    def age_key(key)
      @lru.unshift(@lru.delete(key) || key)
    end
  end
end