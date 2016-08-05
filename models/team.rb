# Should have:
# - id
# - name
# ^ minimum

# For league to work:
# - points (? league should figure this out)
# - Wins, Losses, Draws
# - Goals for, against

# Should be able to:
# - Create new team in db
# - Read team info/stats
# - Update team info
# - Delete team from db
# - Show all teams
# - Delete all teams (convenience)
# - 

require_relative "../db/sql_runner"

class Team

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING * ;"
    team = SqlRunner.run( sql ).first
    @id = team['id']
  end

end