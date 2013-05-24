class LeaderboardPrinter

  def sort_leaderboard(leaderboard)
    leaderboard.sort_by { |k, v| v[:score] }
  end

  def print_leaderboard(leaderboard)
    place = 1
    puts "LEADERBOARD"

    leaderboard.each do |leader|
      distance = leader[1][:distance]
      score = leader[1][:score]
      name = leader[0]

      puts "#{place}: #{name} #{score} #{distance}"

      place += 1
    end
    puts "\n\n"
  end

end
