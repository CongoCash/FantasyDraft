# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PlayerStat.destroy_all
Player.destroy_all
Team.destroy_all
League.destroy_all
User.destroy_all

response = HTTParty.get("http://api.fantasy.nfl.com/v1/players/editordraftranks?format=json")
response["players"].each do |player|
  Player.create({
      name: player["firstName"] +" "+ player["lastName"],
      position: player["position"],
      nfl_team: player["teamAbbr"],
      player_id: player["id"]
      })
end
response = HTTParty.get("http://api.fantasy.nfl.com/v1/players/editordraftranks?format=json&offset=50")
response["players"].each do |player|
    Player.create({
      name: player["firstName"] +" "+ player["lastName"],
      position: player["position"],
      nfl_team: player["teamAbbr"],
      player_id: player["id"]
      })
end
response = HTTParty.get("http://api.fantasy.nfl.com/v1/players/editordraftranks?format=json&offset=100")
response["players"].each do |player|
    Player.create({
      name: player["firstName"] +" "+ player["lastName"],
      position: player["position"],
      nfl_team: player["teamAbbr"],
      player_id: player["id"]
      })
end
response = HTTParty.get("http://api.fantasy.nfl.com/v1/players/editordraftranks?format=json&offset=150")
response["players"].each do |player|
    Player.create({
      name: player["firstName"] +" "+ player["lastName"],
      position: player["position"],
      nfl_team: player["teamAbbr"],
      player_id: player["id"]
      })
end
response = HTTParty.get("http://api.fantasy.nfl.com/v1/players/editordraftranks?format=json&offset=200")
response["players"].each do |player|
    Player.create({
      name: player["firstName"] +" "+ player["lastName"],
      position: player["position"],
      nfl_team: player["teamAbbr"],
      player_id: player["id"]
      })
end

stats = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2017&week=5&format=json")

Player.all.each do |player|
  puts "player_id=" + player.player_id.to_s
  player.player_stat.create({
    pass_attempts: 0,
    pass_completions: 0,
    pass_yards: 0,
    pass_td: 0,
    pass_int: 0,
    rush_attempts: 0,
    rush_yards: 0,
    rush_td: 0,
    receptions: 0,
    receive_yards: 0,
    receive_td: 0,
    fumbles_lost: 0,
    })
end

stats["players"].each do |stat|
  if Player.exists?(player_id: stat["id"].to_i)
    current_player = Player.find_by(player_id: stat["id"].to_i)
    if stat["stats"].length > 0
      puts "id=" + stat["id"]
      current_player.player_stat.update({
        # player_id: stat["id"].to_i,
        pass_attempts: stat["stats"]["2"].to_i,
        pass_completions: stat["stats"]["3"].to_i,
        pass_yards: stat["stats"]["5"].to_i,
        pass_td: stat["stats"]["6"].to_i,
        pass_int: stat["stats"]["7"].to_i,
        rush_attempts: stat["stats"]["13"].to_i,
        rush_yards: stat["stats"]["14"].to_i,
        rush_td: stat["stats"]["15"].to_i,
        receptions: stat["stats"]["20"].to_i,
        receive_yards: stat["stats"]["21"].to_i,
        receive_td: stat["stats"]["22"].to_i,
        fumbles_lost: stat["stats"]["30"].to_i,
      })
    end
  end
end

Player.all.each do |player|
  player_id = player.player_id.to_s
  week_stat = HTTParty.get("http://api.fantasy.nfl.com/v1/players/details?playerId=" + player_id + "&statType=seasonStatsformat=json")
  week_stat["players"][0]["weeks"].each do |week_stats|
    if week_stats["stats"].length > 0
      puts "uuu"
      Player.find_by(player_id: player_id.to_i).player_week_stats.create({
        player_id: player_id.to_i,
        week: week_stats["id"].to_i,
        pass_attempts: week_stats["stats"]["2"].to_i,
        pass_completions: week_stats["stats"]["3"].to_i,
        pass_yards: week_stats["stats"]["5"].to_i,
        pass_td: week_stats["stats"]["6"].to_i,
        pass_int: week_stats["stats"]["7"].to_i,
        rush_attempts: week_stats["stats"]["13"].to_i,
        rush_yards: week_stats["stats"]["14"].to_i,
        rush_td: week_stats["stats"]["15"].to_i,
        receptions: week_stats["stats"]["20"].to_i,
        receive_yards: week_stats["stats"]["21"].to_i,
        receive_td: week_stats["stats"]["22"].to_i,
        fumbles_lost: week_stats["stats"]["30"].to_i,
      })
    else
      puts "ggg"
      Player.find_by(player_id: player_id.to_i).player_week_stats.create({
        player_id: player_id.to_i,
        week: week_stats["id"].to_i,
        pass_attempts: 0,
        pass_completions: 0,
        pass_yards: 0,
        pass_td: 0,
        pass_int: 0,
        rush_attempts: 0,
        rush_yards: 0,
        rush_td: 0,
        receptions: 0,
        receive_yards: 0,
        receive_td: 0,
        fumbles_lost: 0,
      })
    end
  end
end

User.create([
  {
  name: "Jimmy",
  email: "jimmy@test.com",
  password: "test"
  },
  {
  name: "Ellis",
  email: "ellis@test.com",
  password: "test"
  },
  {
  name: "David",
  email: "david@test.com",
  password: "test"
  },
  ])

League.create([
  {
  user: User.first,
  name: "League 1",
  format: "format 1",
  number_of_teams: 10
  },
  {
  user: User.second,
  name: "League 2",
  format: "format 2",
  number_of_teams: 6
  },
  {
  user: User.third,
  name: "League 3",
  format: "format 3",
  number_of_teams: 10
  },
    ])

Team.create([
  {
  name: "Team 1",
  league: League.first,
  user: User.first
  },
  {
  name: "Team 2",
  league: League.first,
  user: User.second
  },
  {
  name: "Team 3",
  league: League.first,
  user: User.third
  },
  {
    name: "Team 4",
    league: League.first,
    user: User.first
  },
  {
    name: "Team 5",
    league: League.first,
    user: User.first
  },
  {
    name: "Team 6",
    league: League.first,
    user: User.first
  },
  {
    name: "Team 7",
    league: League.first,
    user: User.first
  },
  {
    name: "Team 8",
    league: League.first,
    user: User.first
  },
  {
    name: "Team 9",
    league: League.first,
    user: User.first
  },
  {
    name: "Team 10",
    league: League.first,
    user: User.first
  },
  {
  name: "Team 4",
  league: League.second,
  user: User.first
  },
  {
  name: "Team 5",
  league: League.second,
  user: User.second
  },
  {
  name: "Team 6",
  league: League.third,
  user: User.first,
  },
  ])