require 'benchmark'

require './lib/cacheit/rr_cache'
require './lib/cacheit/fifo_cache'
require './lib/cacheit/mru_cache'
require './lib/cacheit/lfu_cache'
require './lib/cacheit/lru_cache'

rr_cache = Cache::RRCache.new(1000)
fifo_cache = Cache::FIFOCache.new(1000)
mru_cache = Cache::MRUCache.new(1000)
lfu_cache = Cache::LFUCache.new(1000)
lru_cache = Cache::LRUCache.new(1000)

puts "**Benchmarks**"

Benchmark.bmbm do |bm|
  bm.report 'RRCache' do
    1_000_000.times { rr_cache[rand(2_000)] ||= :value }
  end

  bm.report 'FIFOCache' do
    1_000_000.times { fifo_cache[rand(2_000)] ||= :value }
  end

  bm.report 'MRUCache' do
    1_000_000.times { mru_cache[rand(2_000)] ||= :value }
  end

  bm.report 'LFUCache' do
    1_000_000.times { lfu_cache[rand(2_000)] ||= :value }
  end

  bm.report 'LRUCache' do
    1_000_000.times { lru_cache[rand(2_000)] ||= :value }
  end
end