guard :rspec, cmd: 'bundle exec rspec' do
  watch('spec/spec_helper.rb')
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
end
