# Cacheit
[![Build Status](https://travis-ci.org/vivangkumar/cacheit.svg)](https://travis-ci.org/vivangkumar/cacheit)

Implementation of some common caching algorithms.

## Algorithms

- LRU (Least Recently Used)
- MRU (Most Recently Used)
- RR (Random Replacement)
- LFU (Least Frequently Used)
- FIFO (First In First Out)

## Usage

```ruby
require 'cacheit'

# Create a new LRU cache
cache = Cache::LRUCache.new(1000)
```

### API

Available API methods -

- `new(size)`
  Initialize a new cache. `size` is the size of the cache.
- `[](key)`
  Get a key from the cache.
- `[]=(key, value)`
  Set a key with a value in the cache.
- `delete(key)`
  Delete a key from the cache.
- `reset`
  Resets the cache. 
- `keys`
  Returns all the keys currently in the cache.
- `values`
  Returns all the values associated with keys, currently in the cache.
- `length`
  Returns the current lenght of the cache

Available Cache implementations -
All cache's are part of the `Cache` module.

- `LRUCache`
- `MRUCache`
- `FIFOCache`
- `LFUCache`
- `RRCache`

## Installation

Add this line to your application's Gemfile:

    gem 'cacheit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cacheit

## Tests

Run tests using `rspec`

## Contributing

1. Fork it (http://github.com/vivangkumar/cacheit/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Notes

Most algorithms still need to be optimized to meet time constraints.
