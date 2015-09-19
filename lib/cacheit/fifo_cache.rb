require_relative 'base_cache'

module Cache

  # The first inserted key is discarded when
  # cache size is exceeded
  class FIFOCache < BaseCache
    attr_accessor :size, :cache, :queue

    def initialize(size)
      super(size)
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
      end

      @cache[key] = value
    end

    def delete(key)
      @cache.delete(key)
    end

    def reset
      super
    end
  end
end