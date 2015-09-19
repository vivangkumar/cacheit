require_relative 'base_cache'

module Cache

  # Discards, in contrast to LRU, the most recently used items first.
  class MRUCache < BaseCache
    attr_accessor :size, :cache, :mru

    def initialize(size)
      super(size)
      @mru = []
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
      if @mru.size >= @size
        @cache.delete(@mru.shift)
      end
      
      @cache[key] = value
      age_key(key)
    end

    def delete(key)  
      @cache.delete(key)
      @mru.delete(key)
    end

    def reset
      super
      @mru = []
    end

    private

    def age_key(key)
      @mru.unshift(@mru.delete(key) || key)
    end
  end
end