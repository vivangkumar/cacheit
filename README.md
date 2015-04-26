# Cacheit
[![Build Status](https://travis-ci.org/vivangkumar/cacheit.svg)](https://travis-ci.org/vivangkumar/cacheit)

Implementation of some common caching algorithms.

## Algorithms

- LRU (Least Recently Used)
- MRU (Most Recently Used)
- RR (Random Replacement)
- LFU (Least Frequently Used)
- FIFO (First In First Out)

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
