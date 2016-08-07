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

  def all_matches(team)
    home_matches(team) + away_matches(team)
  end

  def home_matches(team)
    matches = @matches.select do |match|
      match.home_team_id == team.id
    end
    return matches
  end

  def away_matches(team)
    matches = @matches.select do |match|
      match.away_team_id == team.id
    end
    return matches
  end

  def wins(team)
    home_wins = home_matches(team).select do |match|
      (match.home_team_score > match.away_team_score)
    end 
    away_wins = away_matches(team).select do |match|
     match.away_team_score > match.home_team_score
    end
    return home_wins.count + away_wins.count
  end

  def draws(team)
    draws = all_matches(team).select do |match|
      match.home_team_score == match.away_team_score
    end
    return draws.count
  end

  def losses(team)
    home_losses = home_matches(team).select do |match|
      (match.home_team_score < match.away_team_score)
    end 
    away_losses = away_matches(team).select do |match|
     match.away_team_score < match.home_team_score
    end
    return home_losses.count + away_losses.count
  end

  def points(team)
    win_points  = 3
    draw_points = 1
    loss_points = 0 # might change one day, who knows?
    return (wins(team) * win_points) + (draws(team) * draw_points) + (losses(team) * loss_points)
  end

  def goals_for(team)
    goals = 0
    home_matches(team).each { |match| goals += match.home_team_score }
    away_matches(team).each { |match| goals += match.away_team_score }
    return goals
  end


end

