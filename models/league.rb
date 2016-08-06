# Should have:
# - Access to set of teams
# - Access to matches

# Should be able to:
# - Figure out a team's WLD from matches
# - Figure out points, based on WLD

require_relative "./match"
require_relative "./team"

class League

  attr_reader :teams, :matches

  def initialize(teams, matches)
    @teams = teams
    @matches = matches
  end

  def team_names
    names = @teams.map {|team| team.name}
    return names.sort
  end

  def wins(team)
    home_wins(team) + away_wins(team)
  end

  private

  def home_wins(team)
    wins = 0
    matches = @matches.find_all do |match|
      match.home_team_id == team.id
    end
    matches.each do |match|
      wins += 1 if match.home_team_score > match.away_team_score
    end
    return wins
  end

  def away_wins(team)
    wins = 0
    matches = @matches.select do |match|
      match.away_team_id == team.id
    end
    matches.each do |match|
      wins += 1 if match.away_team_score > match.home_team_score
    end
    return wins
  end

end

