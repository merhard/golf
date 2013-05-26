require_relative 'course_layout'
require_relative 'scorecard'
require_relative 'scorecard_printer'
require_relative 'leaderboard_printer'


class Golf
  attr_reader :course_file, :scores_file


  def initialize(course_file = 'default_course_layout.csv', scores_file = 'default_scorecard.csv')
    @course_file = course_file
    @scores_file = scores_file
  end


  def course_layout
    course = CourseLayout.new(@course_file)
    @course = course.course_layout_data_loader
  end


  def scorecard
    scorecard = Scorecard.new(@scores_file)
    @scores_hash = scorecard.scorecard_data_loader
  end


  def printer
    @print = ScorecardPrinter.new(@scores_hash, @course)
    golfers = @print.print_scoreboard

    @leaderboard = LeaderboardPrinter.new

    sorted_leaderboard = @leaderboard.sort_leaderboard(golfers)
    @leaderboard.print_leaderboard(sorted_leaderboard)
  end

end

golf = Golf.new
golf.course_layout
golf.scorecard
golf.printer
