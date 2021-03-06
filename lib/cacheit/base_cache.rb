require 'forwardable'

module Cache
  class BaseCache
    extend Forwardable
    attr_accessor :cache

    def initialize(size)
      @size = size
      @cache = {}
    end

    def_delegator :@cache, :keys, :keys
    def_delegator :@cache, :values, :values
    def_delegator :@cache, :length, :length
    def_delegator :@cache, :delete, :delete

    def [](key)
    end

    def []=(key, value)
      @cache[key] = value unless @cache.has_key?(key)
    end

    alias get []
    alias set []=

    def reset
      @cache = {}
      @size = 0
    end
  end
end