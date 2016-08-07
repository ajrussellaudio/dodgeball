require "text-table"
require "pry-byebug"
require_relative "./models/league"

class LeagueRunner

  def initialize(league)
    @league = league
  end

  def run()
    @fixtures = generate_matches()
    while @fixtures.count >= 0
      display_table()
      play_week()
    end
  end

  def display_table()
    # system "clear"
    table = Text::Table.new
    table.head = ["Team Name", "P", "W", "L", "D", "GF", "GA", "Points"]
    table.rows = []
    teams = @league.teams.sort {|x, y| @league.points(y) <=> @league.points(x)}
    teams.each do |team|
      row = []
      row << team.name
      row << @league.all_matches(team).count
      row << @league.wins(team)
      row << @league.losses(team)
      row << @league.draws(team)
      row << @league.goals_for(team)
      row << @league.goals_against(team)
      row << @league.points(team)
      table.rows << row
    end
    puts table.to_s
  end

  def generate_matches()
    ids = @league.teams.map { |team| team.id }
    ids.permutation(2).to_a
  end

  def play_week()
    puts "Press [enter] to continue."
    gets.chomp
    games_this_week = weekly_fixtures
    games_this_week.each { |game| play_match(game) }
  end

  def weekly_fixtures()
    return games
  end

  def play_match(pair)
    @league.play_game(Match.new({
      "home_team_id" => pair.first,
      "away_team_id" => pair.last,
      "home_team_score" => rand(20),
      "away_team_score" => rand(20)
      }))

  end



end

teams = [
  Team.new({ "name" => "Glasgow Bigots" }),
  Team.new({ "name" => "Edinburgh Tourists" }),
  Team.new({ "name" => "Dundee Jakeys" }),
  Team.new({ "name" => "Aberdeen Sheepshaggers" }),
  Team.new({ "name" => "Inverness Teuchters" }),
  Team.new({ "name" => "Stirling Dolequeue" }),
  Team.new({ "name" => "Perthshire Tedium" }),
  Team.new({ "name" => "Fife Accents" }),
]
matches = []

league = League.new({
  "teams"   => teams,
  "matches" => matches
  })

scottish_dodgeball_league = LeagueRunner.new(league)
scottish_dodgeball_league.run()