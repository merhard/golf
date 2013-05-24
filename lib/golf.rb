require_relative 'course_layout'
require_relative 'scorecard'
require_relative 'scorecard_printer'
require_relative 'leaderboard_printer'


class Golf

  def initialize(course_file = nil, scores_file = nil)
    if course_file == nil
      course_layout = CourseLayout.new
    else
      course_layout = CourseLayout.new(course_file)
    end

    @course = course_layout.course_layout_data_loader

    if scores_file == nil
      scorecard = Scorecard.new
    else
      scorecard = Scorecard.new(scores_file)
    end

    @scores_array = scorecard.scorecard_data_loader

    @print = ScorecardPrinter.new(@scores_array, @course)
    @leaderboard = LeaderboardPrinter.new
  end

  def printer
    golfers = @print.print_scoreboard

    sorted_leaderboard = @leaderboard.sort_leaderboard(golfers)
    @leaderboard.print_leaderboard(sorted_leaderboard)
  end

end

golf = Golf.new
golf.printer
