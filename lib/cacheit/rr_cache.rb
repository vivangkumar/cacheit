require_relative 'base_cache'

module Cache
  # Randomly selects a candidate item and discards it to make space when necessary. 
  # This algorithm does not require keeping any information about the access history.
  class RRCache < BaseCache
    attr_accessor :size
    attr_accessor :length
    attr_accessor :cache

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
      if @cache.size >= @size
        @cache.delete(@cache.values[rand(@cache.length)])
        @length -= 1
      end

      @cache[key] = value
      @length += 1
    end
  end
end