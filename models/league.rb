# Should have:
# - Access to set of teams
# - Access to matches

# Should be able to:

require_relative "./match"
require_relative "./team"

class League

  attr_reader :teams

  def initialize( options )
    Match.delete_all()
    Team.delete_all()
    @teams = options[:teams]
    @teams.each { |team| team.save() }
  end

end

