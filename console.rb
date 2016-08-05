require_relative "./models/team"
require "pry-byebug"

Team.delete_all

team1 = Team.new({
  "name" => "Glasgow Jakeys"
  })
team2 = Team.new({
  "name" => "Edinburgh Tourists"
  })

team1.save()
team2.save()

binding.pry
nil