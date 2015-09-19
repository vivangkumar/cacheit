require 'benchmark'

require '../lib/cacheit/rr_cache'
require '../lib/cacheit/fifo_cache'

rr_cache = Cache::RRCache.new(1000)
fifo_cache = Cache::FIFOCache.new(1000)

puts "**Benchmarks**"

Benchmark.bmbm do |bm|
  bm.report 'RRCache' do
    1_000_000.times { rr_cache[rand(2_000)] ||= :value }
  end

  bm.report 'FIFOCache' do
    1_000_000.times { fifo_cache[rand(2_000)] ||= :value }
  end
end