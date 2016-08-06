# Should have:
# - Access to set of teams √
# - Access to matches √

# Should be able to:
# - Figure out a team's WLD from matches √
# - Figure out points, based on WLD √

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
    wins = @matches.select do |match|
      (
        match.home_team_id == team.id && match.home_team_score > match.away_team_score
      ) || (
        match.away_team_id == team.id && match.away_team_score > match.home_team_score
      )
    end
    return wins.count
  end

  def draws(team)
    draws = @matches.select do |match|
      (
        match.home_team_id == team.id || match.away_team_id == team.id
      ) && match.home_team_score == match.away_team_score
    end
    return draws.count
  end

  def losses(team)
    losses = @matches.select do |match|
      (
        match.home_team_id == team.id && match.home_team_score < match.away_team_score
      ) || (
        match.away_team_id == team.id && match.away_team_score < match.home_team_score
      )
    end
    return losses.count
  end

  def points(team)
    win_points  = 3
    draw_points = 1
    loss_points = 0
    return (wins(team) * win_points) + (draws(team) * draw_points) + (losses(team) * loss_points)
  end

end

