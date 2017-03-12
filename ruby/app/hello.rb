require 'faker'
require 'redis'

puts "Hello #{Faker::Name.name}!"
redis = Redis.new(:host => "172.18.0.2", :port => 6379, :db => 15)
redis.set("docker", "awesome")
puts "Docker is #{redis.get("docker")}"
