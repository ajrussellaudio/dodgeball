require "minitest/autorun"
require "minitest/rg"
require_relative "../league"
require_relative "../team"

class TestLeague < MiniTest::Test

  def setup
    team1 = Team.new({
      "name" => "Glasgow"
      })
    team2 = Team.new({
      "name" => "Edinburgh"
      })
    team3 = Team.new({
      "name" => "Dundee"
      })
    team4 = Team.new({
      "name" => "Aberdeen"
      })
    @league_of_2 = League.new({
      teams: [team1.save(), team2.save()],
      })
    @league_of_4 = League.new({
      teams: [team1.save(), team2.save(), team3.save(), team4.save()]
      })
  end

  def test_teams_in_league
    assert_equal(2, @league_of_2.teams.count)
  end

end