require 'spec_helper'

describe Cache::LFUCache do
  describe '#initialize' do
    it 'should create a new cache' do
      cache = Cache::LFUCache.new(10)
      expect(cache.size).to be(10);
    end
  end

  describe '#set' do
    cache = Cache::LFUCache.new(3)
    it 'should set a value in the cache' do
      cache['test'] = 'test'
      expect(cache.cache['test']).to eq('test')
    end

    it 'should expire the least frequently used key' do
      cache['test1'] = 'test1'
      cache['test2'] = 'test2'
      cache['test1']
      cache['test1']
      cache['test4'] = 'test4'
      expect(cache.cache.has_key?('test')).to eq(false)
    end

    it 'should only contain 3 keys' do
      expect(cache.cache.length).to eq(3)
    end
  end

  describe '#get' do
    cache = Cache::LFUCache.new(5)
    it 'should get a value from the cache' do
      cache['test'] = 'test'
      expect(cache['test']).to eq('test')
    end

    it 'should return nil if key is not found' do
      expect(cache['test1']).to eq(nil)
    end
  end

  describe '#reset' do
    it 'should reset the cache' do
      cache = Cache::LFUCache.new(5)
      cache['test1'] = 'test1'
      cache.reset
      expect(cache.cache).to eq({})
    end
  end

  describe '#delete' do
    it 'should delete a key if it is in the cache' do
      cache = Cache::LFUCache.new(1)
      cache['test'] = 'test'
      cache.delete('test')
      expect(cache.cache).to eq({})
    end

    it 'should decrement the length when a key is deleted' do
      cache = Cache::LFUCache.new(1)
      cache['blah'] = 'blah'
      cache.delete('blah')
      expect(cache.length).to eq(0)
    end

    it 'should not delete a key if its not in the cache' do
      cache = Cache::LFUCache.new(1)
      cache['test'] = 'test'
      cache.delete('test2')
      expect(cache.cache).to eq({'test' => 'test'})
    end
  end

  describe '#keys' do
    it 'should return keys of the cache' do
      cache = Cache::LFUCache.new(3)
      cache['test'] = 'test'
      cache['test1'] = 'test1'
      cache['test2'] = 'test2'
      expect(cache.keys).to eq(['test', 'test1', 'test2'])
    end
  end

  describe '#values' do
    it 'should return values in the cache' do
      cache = Cache::LFUCache.new(3)
      cache['test'] = 'test'
      cache['test1'] = 'test1'
      cache['test2'] = 'test2'
      expect(cache.values).to eq(['test', 'test1', 'test2'])
    end
  end
end