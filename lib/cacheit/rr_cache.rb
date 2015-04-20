require_relative 'base_cache'

module Cache
  # Randomly selects a candidate item and discards it to make space when necessary. 
  # This algorithm does not require keeping any information about the access history.
  class RRCache < BaseCache
    def initialize(size)
    end

    def [](key)
    end

    def []=(key, value)
    end
  end
end