RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect] # Disable warnings
  end
end


RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect] # Disable warnings
  end
end
