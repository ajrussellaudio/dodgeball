# Should have:
# - id
# - home_team_id
# - away_team_id
# - home_team_score
# - away_team_score

# Should be able to:
# - Create new match √
# - Read match result
# - Update match (with score?)
# - Delete match (not really necessary, match declared void?)
# - Return all matches
# - Return both teams who played in a match (hash of :home and :away ?)
# - Delete all matches (convenience)

require_relative "../db/sql_runner"

class Match

  attr_accessor :home_team_id, :away_team_id, :home_team_score, :away_team_score
  attr_reader :id

  def self.all
    sql = "SELECT * FROM matches;"
    matches = SqlRunner.run( sql )
    return matches.map { |match_info| Match.new(match_info) }
  end

  def initialize( options )
    @id              = options["id"].to_i
    @home_team_id    = options["home_team_id"].to_i
    @away_team_id    = options["away_team_id"].to_i
    @home_team_score = options["home_team_score"].to_i
    @away_team_score = options["away_team_score"].to_i
  end

  def save()
    sql = "INSERT INTO matches (
      home_team_id,
      away_team_id,
      home_team_score,
      away_team_score
      ) VALUES (
      #{@home_team_id},
      #{@away_team_id},
      #{@home_team_score},
      #{@away_team_score}
      ) RETURNING * ;"
    match = SqlRunner.run( sql ).first
    @id = match["id"]
  end

end