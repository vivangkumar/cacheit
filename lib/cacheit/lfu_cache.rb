require_relative 'base_cache'

module Cache

  # The standard characteristics of this method involve the system 
  # keeping track of the number of times a block is referenced in memory. 
  # When the cache is full and requires more room the system will purge 
  # the item with the lowest reference frequency.
  class LFUCache < BaseCache
    attr_reader :size, :cache

    def initialize(size)
      super(size)
      @lfu = {}
    end

    def [](key)
      if @cache.has_key?(key)
        increment_usage(key)
        @cache[key]
      end
    end

    def []=(key, value)
      if @cache.length >= @size
        lfu_key = @lfu.min_by{ |k, v| }.first
        @cache.delete(lfu_key)
        @lfu.delete(lfu_key)
      end

      super
      @lfu[key] = 0 if !@lfu.has_key?(key)

      increment_usage(key)
    end

    def delete(key)
      super
      @lfu.delete(key)
    end

    def reset
      super
      @lfu = {}
    end

    private

    def increment_usage(key)
      @lfu[key] += 1
    end
  end
end