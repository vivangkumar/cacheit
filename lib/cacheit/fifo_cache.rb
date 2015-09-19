require_relative 'base_cache'

module Cache

  # The first inserted key is discarded when
  # cache size is exceeded
  class FIFOCache < BaseCache
    attr_reader :size, :cache

    def initialize(size)
      super(size)
    end

    def [](key)
      @cache[key] if @cache.has_key?(key)
    end

    def []=(key, value)
      @cache.shift if @cache.length >= @size
      @cache[key] = value
    end

  end
end