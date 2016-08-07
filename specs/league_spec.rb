require "minitest/autorun"
require "minitest/rg"
require_relative "../models/league"

class TestLeague < MiniTest::Test

  def setup
    Match.delete_all
    Team.delete_all
    team_gla = Team.new({
      "name" => "Glasgow"
      })
    team_edn = Team.new({
      "name" => "Edinburgh"
      })
    @team_gla = team_gla.save()
    @team_edn = team_edn.save()
    match1 = Match.new({
      "home_team_id" => team_gla.id,
      "away_team_id" => team_edn.id,
      "home_team_score" => 14,
      "away_team_score" => 9
      })
    match2 = Match.new({
      "home_team_id" => team_edn.id,
      "away_team_id" => team_gla.id,
      "home_team_score" => 12,
      "away_team_score" => 12
      })
    @match1 = match1.save()
    @match2 = match2.save()
    @test_league = League.new({
      "teams" => Team.all,
      "matches" => Match.all
    })
  end

  def test_teams_in_league
    assert_equal(2, @test_league.teams.count)
  end

  def test_matches_in_league
    assert_equal(2, @test_league.matches.count)
  end

  def test_can_find_team_names
    assert_equal(["Edinburgh", "Glasgow"], @test_league.team_names)
  end

  def test_can_find_team_wins
    assert_equal(1, @test_league.wins(@team_gla))
  end

  def test_can_find_team_draws
    assert_equal(1, @test_league.draws(@team_gla))
  end

  def test_can_find_team_losses
    assert_equal(1, @test_league.losses(@team_edn))
  end

  def test_can_find_team_points
    assert_equal(4, @test_league.points(@team_gla))
    assert_equal(1, @test_league.points(@team_edn))
  end

  def test_can_find_goals_scored
    assert_equal(14 + 12, @test_league.goals_for(@team_gla))
  end

  def test_can_find_goals_conceded
    assert_equal(9 + 12, @test_league.goals_against(@team_gla))
  end

  def test_can_play_match
    match3 = Match.new({
      "home_team_id" => @test_league.teams.first.id,
      "away_team_id" => @test_league.teams.last.id,
      "home_team_score" => 13,
      "away_team_score" => 8
      })
    @test_league.play_game(match3)
    assert_equal(3, @test_league.matches.count)
  end

end