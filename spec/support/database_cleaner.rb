RSpec.configure do |config|
  # Before the entire test suite runs,
  # clear the test database completely
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  # The database default cleaning strategy
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # Change strategy to truncation
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  # These lines hook up database_cleaner around the beginning 
  # and end of each test, telling it to execute whatever 
  # cleanup strategy we selected beforehand.
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
