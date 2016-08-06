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
    @league_of_2 = League.new({
      teams: [team1.save(), team2.save()],
      })
  end

  def test_teams_in_league
    assert_equal(2, @league_of_2.teams.count)
  end

  def test_matches
    assert_equal(2, @league_of_2.matches.count)
  end

end