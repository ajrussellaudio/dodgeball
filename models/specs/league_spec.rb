require "minitest/autorun"
require "minitest/rg"
require_relative "../league"
require_relative "../team"

class TestLeague < MiniTest::Test

  def setup
    team1 = Team.new({
      "name" => "Glasgow Bigots"
      })
    team2 = Team.new({
      "name" => "Edinburgh Tourists"
      })
    @test_league = League.new({
      teams: [team1, team2],
      })
  end

  def test_teams_in_league
    assert_equal(2, @test_league.teams.count)
  end

end