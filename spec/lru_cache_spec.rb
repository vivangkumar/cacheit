require 'spec_helper'
require_relative '../lib/cacheit/lru_cache'
require_relative '../lib/cacheit/base_cache'

describe Cache::LRUCache do
  describe '#initialize' do
    it 'should create a new cache' do
      cache = Cache::LRUCache.new(10)
      expect(cache.capacity).to be(10);
    end
  end

  describe '#set' do
    cache = Cache::LRUCache.new(3)
    it 'should set a value in the cache' do
      cache.set('test', 'test')
      expect(cache.cache['test']).to eq('test')
    end

    it 'should expire the least used key' do
      cache.set('test1', 'test1')
      cache.set('test2', 'test2')
      cache.get('test')
      cache.get('test1')
      cache.set('test3', 'test3')
      expect(cache.cache.has_key?('test2')).to eq(false)
    end

    it 'should only contain 3 keys' do
      expect(cache.cache.length).to eq(3)
    end
  end

  describe '#get' do
    cache = Cache::LRUCache.new(5)
    it 'should get a value from the cache' do
      cache.set('test', 'test')
      expect(cache.get('test')).to eq('test')
    end

    it 'should return nil if key is not found' do
      expect(cache.get('test1')).to eq(nil)
    end
  end

  describe '#reset' do
    it 'should reset the cache' do
      cache = Cache::LRUCache.new(5)
      cache.set('test1', 'test1')
      cache.reset()
      expect(cache.cache).to eq({})
    end
  end
end