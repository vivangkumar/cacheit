require_relative 'base_cache'

module Cache

  # The first inserted key is discarded when
  # cache size is exceeded
  class FIFOCache < BaseCache
    attr_accessor :size
    attr_accessor :cache
    attr_accessor :queue

    def initialize(size)
      super(size)
      @queue = []
    end

    def [](key)
      if @cache.has_key?(key)
        @cache[key]
      else
        nil
      end
    end

    def []=(key, value)
      if @cache.length >= @size
        @cache.shift
        @queue.shift
      end

      @cache[key] = value
      @queue << key
    end

    def delete(key)
      @cache.delete(key)
      @queue.delete(key)
    end

    def reset
      super
      @queue = []
    end
  end
end