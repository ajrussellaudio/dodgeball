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
    @test_league = League.new({
      teams: [team1, team2, team3, team4]
      })
  end

  def test_teams_in_league
    assert_equal(4, @test_league.teams.count)
  end

end