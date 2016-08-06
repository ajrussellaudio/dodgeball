require_relative "./models/team"
require_relative "./models/match"
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

match_new = Match.new({
  "home_team_id" => team1.id,
  "away_team_id" => team2.id,
  })
match_played = Match.new({
  "home_team_id"    => team1.id,
  "away_team_id"    => team2.id,
  "home_team_score" => 14,
  "away_team_score" => 9,
  })

match_new.save()
match_played.save()

binding.pry
nil