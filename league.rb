# Should have:
# - Array of team objects, sorted by points
# - array of matches, sorted by id (history)

# Should be able to:
# - Show pretty table of league stats
# - Create team objects & db rows
# - Create array of games for week 
# - Create array of weeks (fixtures for season) ( ^ permutations of teams)
# - Create matches (play fixtures)

require_relative "./models/team"
require "pry-byebug"

team1 = Team.new({
  "name" => "Glasgow Jakeys"
  })

team1.save()

binding.pry
nil