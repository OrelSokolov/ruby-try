Ruby Try
========
[![Gem Version](https://badge.fury.io/rb/ruby-try.svg)](http://badge.fury.io/rb/ruby-try)
[![Dependency Status](https://gemnasium.com/OrelSokolov/ruby-try.svg)](https://gemnasium.com/OrelSokolov/ruby-try)
[![Build Status](https://travis-ci.org/OrelSokolov/ruby-try.svg)](https://travis-ci.org/OrelSokolov/ruby-try)
[![Code Climate](https://codeclimate.com/github/OrelSokolov/ruby-try/badges/gpa.svg)](https://codeclimate.com/github/OrelSokolov/ruby-try)

This gem has two versions of `try()`. 

* **Vanilla `try()`** 
  * RoR vanilla `try()` and `try!()`. Nothing new.
* **Boolean `try?()`** 
  * `try()` for boolean functions. It is returns `false` instead of `nil`, when trying to call
something like `nil.try(:some_boolean_method?)`

```ruby
irb(main):001:0> require 'ruby-try'
=> true
irb(main):002:0> nil.try(:admin?)
=> nil
irb(main):003:0> nil.try(:nil?) 
=> nil                             # does it make sense? 
irb(main):004:0> nil.try?(:admin?)
=> false
irb(main):005:0> nil.try?(:nil?)   # IMHO, it makes sense
=> true
```

Why boolean `try?`
=================

Imagine, we have something like this:

```ruby
def admin_in_team?(team)
  if m = team_members.find_by_team_id(team.id)
    m.admin?
  else
    false
  end
end
```

Of course, it is better to write something like

```ruby
def admin_in_team?(team)
  team_members.find_by_team_id(team.id).try(:admin?)
end
```

But there is a TRAP! If `find_by_team_id(team.id)` returns `nil`,
`nil.try(:anything)` returns `nil`. Is it a reason for writing this HUGE `if`?
I don't think so. 

First idea is to patch `try()`. But it is not best idea. Many developers expects
vanilla behavior from `try()`, so that's why a new `try?()` method appears. It is looks not
elegant, but one line is better than 5 with misty logic.

## Compatibility
- 2.1.2
- 2.0.0
- 1.9.3
- jruby-19mode # JRuby in 1.9 mode


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-try'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-try

## Documentation
Please, use specs to explore behavior of this gem. Or refer to RoR documentation.

```bash
git clone https://github.com/OrelSokolov/ruby-try
cd ruby-try
bundle
rspec spec/
```

## Contributing

1. Fork it ( https://github.com/OrelSokolov/ruby-try/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


AUTHORS
========

* [Oleg Orlov](https://github.com/OrelSokolov)
* [RoR team](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/object/try.rb)


LICENSE
=======

This gem is released under the MIT License.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
