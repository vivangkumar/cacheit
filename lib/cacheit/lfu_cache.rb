require_relative 'base_cache'

module Cache
  class LFUCache < BaseCache
    def initialize(size)
      super(size)
      @lfu = []
    end

    def [](key)
    end

    def []=(key, value)
    end

    def delete
    end
  end
end