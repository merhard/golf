require_relative 'course_layout'
require_relative 'scorecard'
require_relative 'scorecard_printer'


class Golf
  attr_accessor :print

  def initialize
    course_layout = CourseLayout.new
    @course = course_layout.course_layout_data_loader

    scorecard = Scorecard.new
    @scores_array = scorecard.scorecard_data_loader

    @print = ScorecardPrinter.new(@scores_array, @course)
  end

  def printer
    @leaderboard = @print.print_scoreboard
  end




end

golf = Golf.new
golf.printer

