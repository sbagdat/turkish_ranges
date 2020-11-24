# TurkishRanges

[![Gem Version](https://badge.fury.io/rb/turkish_ranges.svg)](https://badge.fury.io/rb/turkish_ranges)
[![Build Status](https://travis-ci.org/sbagdat/turkish_ranges.svg?branch=main)](https://travis-ci.org/sbagdat/turkish_ranges)
[![Code Climate](https://codeclimate.com/github/sbagdat/turkish_ranges/badges/gpa.svg)](https://codeclimate.com/github/sbagdat/turkish_ranges)


Ranges and comparisons meet Turkish language. 

**NOTICE:** This gem can create one-dimensional ranges like `a`..`z` and multi-dimensional ranges like `aa`..`az`. It can't 
create complex ranges like `a`..`abc` right now. I have intended to add this feature in the near future. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'turkish_ranges'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install turkish_ranges

## Usage

```ruby
require 'turkish_ranges'

include TurkishRanges

# Creating new texts
TrText.new('Türkçe')

# Comparing texts containing Turkish letters
TrText.new('Ğ')      > TrText.new('Ü')       # false
TrText.new('abbası') < TrText.new('abbasi')  # true

# Creating ranges containing Turkish letters
full_upcase_range = TrText.new('A')..TrText.new('Z')
full_upcase_range.to_a  
# => [A, B, C, Ç, D, E, F, G, Ğ, H, I, İ, J, K, L, M, 
#     N, O, Ö, P, Q, R, S, Ş, T, U, Ü, V, W, X, Y, Z]

full_downcase_range = TrText.new('A')..TrText.new('Z')
full_downcase_range.to_a  
# => [a, b, c, ç, d, e, f, g, ğ, h, ı, i, j, k, l, m,
#     n, o, ö, p, q, r, s, ş, t, u, ü, v, w, x, y, z]

(TrText.new('aa')..TrText.new('ax')).to_a
# => [aa, ab, ac, aç, ad, ae, af, ag, ağ, ah, aı, ai, aj, ak, al, 
#     am, an, ao, aö, ap, aq, ar, as, aş, at, au, aü, av, aw, ax]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sbagdat/turkish_ranges. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/turkish_ranges/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TurkishRanges project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/turkish_ranges/blob/master/CODE_OF_CONDUCT.md).
