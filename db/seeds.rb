# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[Stuff,StuffDay,StuffSchedule,StuffScheduleSubscription].each do |cls|
  cls.destroy_all
end

User.all.select { |x| x.provider.nil? }.each { |x| x.destroy }

me = User.where(:email => "mharris717@gmail.com").first
izzy = User.where(:email => "izzyinme@gmail.com").first
jp = User.create!(:email => "jay.pare@gmail.com", :password => "password", :first_name => "Jason", :last_name => "Pare")

read = Stuff.create! :name => "Read Books", :creator => me
push = Stuff.create! :name => "Pushups", :creator => me
run = Stuff.create! :name => "Run", :creator => izzy

read_200 = read.schedules.create! :creator => jp, :target_amount => 200
run_10 = run.schedules.create! :creator => izzy, :target_amount => 10
push_100 = push.schedules.create! :creator => me, :target_amount => 100

read_sub_me = read_200.subs.create! :user => me
read_sub_jp = read_200.subs.create! :user => jp

run_sub_izzy = run_10.subs.create! :user => izzy

push_100.subs.create! :user => me

StuffDay.create! :user => me, :stuff => read, :day => Date.new(2012,11,10), :amount => 10
StuffDay.create! :user => me, :stuff => read, :day => Date.new(2012,11,11), :amount => 30

StuffDay.create! :user => jp, :stuff => read, :day => Date.new(2012,11,11), :amount => 50

puts me.stuffs.count