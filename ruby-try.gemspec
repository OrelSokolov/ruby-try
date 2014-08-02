# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'ruby-try'
  spec.version     = '1.0.0'
  spec.date        = '2014-08-01'
  spec.summary     = "Provides RoR try() and extends it by new try?() method."
  spec.description = <<-DESC
    This gem has two versions of `try()`. 

    Vanilla `try()`
      This is RoR vanilla `try()` and `try!()` methods. Nothing new.
    Boolean `try?()`
      It is returns `false` instead of `nil`, when trying to call something like 
      `nil.try?(:some_boolean_method?)`
  DESC
  spec.authors     = ["Oleg Orlov"]
  spec.email       = 'orelcokolov@gmail.com'
  spec.homepage    = 'http://rubygems.org/gems/ruby-try'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
