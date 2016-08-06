# Should have:
# - id √
# - name √
# ^ minimum

# Should be able to:
# - Create new team in db √
# - Read team info/stats √
# - Update team info √
# - Delete team from db
# - Show all teams √
# - Delete all teams (convenience) √
# - 

require_relative "../db/sql_runner"

class Team

  attr_accessor :name, :wins, :losses, :draws
  attr_reader :id

  def self.all
    sql = "SELECT * FROM teams;"
    teams = SqlRunner.run( sql )
    return teams.map { |team_info| Team.new(team_info) }
  end

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run( sql )
  end

  def initialize( options )
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING * ;"
    team = SqlRunner.run( sql ).first
    @id = team['id']
  end

  def update()
    sql = "UPDATE teams SET
      name = '#{@name}',
      WHERE id = #{@id}
      RETURNING * ;"
    SqlRunner.run( sql )
    return self
  end

  def delete()
    sql = "DELETE FROM teams WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

end