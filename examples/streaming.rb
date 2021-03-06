# 
# This example shows how to run a query that gets a callback as the results become available.
#

require 'rubygems'
require 'async-mysql'
require 'eventmachine'
require 'logger'

# Run EventMachine
EventMachine::run do
  AsyncMysql::default_log_level = Logger::INFO
  connection = AsyncMysql::Connection.new('localhost', 3306)
  connection.username = 'root'
  connection.password = ''
  connection.database = 'mysql'
  
  connection.connect do
    puts "Connected to MySQL server."
    
    query_streaming("select * from user") do |result|
      puts result.attributes.inspect
    end
  end
end

