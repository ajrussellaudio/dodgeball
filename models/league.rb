# Should have:
# - Array of team objects, sorted by points
# - array of matches, sorted by id (history)

# Should be able to:
# - Create array of games for week 
# - Create array of weeks (fixtures for season) ( ^ permutations of teams)
# - Create matches (play fixtures)

require_relative "./match"

class League

  attr_reader :teams

  def initialize( options )
    @teams = options[:teams]
  end

end

