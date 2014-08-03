RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect] # Disable warnings
  end
end


RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect] # Disable warnings
  end
end
