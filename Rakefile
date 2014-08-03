require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:ensure_all_specs_pass)


task :ensure_all_commited do
 untracked = `git ls-files --others --exclude-standard`
 modified = `git ls-files -m`
 uncommited_changed = `git diff --shortstat --staged`
 if untracked.length > 0 || modified.length > 0 || uncommited_changed.length > 0
  abort("Commit your changes first and leave directory clean.")
 end
end

task :check

task :check => :ensure_all_commited
task :check => :ensure_all_specs_pass

task :build => :check
task :default => :ensure_all_specs_pass
