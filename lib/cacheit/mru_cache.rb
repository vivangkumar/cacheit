require_relative 'base_cache'

module Cache

  # Discards, in contrast to LRU, the most recently used items first.
  class MRUCache < BaseCache
    attr_reader :size, :cache

    def initialize(size)
      super(size)
      @mru = []
    end

    def [](key)
      if @cache.has_key?(key)
        age_key(key)
        @cache[key]
      end
    end

    def []=(key, value)
      @cache.delete(@mru.shift) if @mru.size >= @size
      super
      age_key(key)
    end

    def delete(key)  
      super
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