class LeaderboardPrinter

  def sort_leaderboard(leaderboard)
    leaderboard.sort_by { |k, v| v[:score] }
  end

  def print_leaderboard(leaderboard)
    place = 0

    puts "LEADERBOARD"

    leaderboard.each do |leader|
      place += 1

      distance = leader[1][:distance]
      score = leader[1][:score]
      name = leader[0]

      puts "#{place}: #{name} #{score} #{distance}"
    end

    puts "\n\n"

    place
  end

end
