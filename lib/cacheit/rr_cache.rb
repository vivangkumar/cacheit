require_relative 'base_cache'

module Cache
  # Randomly selects a candidate item and discards it to make space when necessary. 
  # This algorithm does not require keeping any information about the access history.
  class RRCache < BaseCache
    attr_reader :size, :cache 

    def initialize(size)
      super(size)
    end

    def [](key)
      @cache[key] if @cache.has_key?(key)
    end

    def []=(key, value)
      evict_random if @cache.size >= @size
      super
    end

    private

    def evict_random
      @cache.delete(@cache.values[rand(@cache.length)])
    end
  end
end