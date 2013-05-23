require_relative 'course_layout'
require_relative 'scorecard'


class Golf
  def initialize
    course_layout = CourseLayout.new
    @course = course_layout.course_layout_data_loader
    scorecard = Scorecard.new
    @scores = scorecard.scorecard_data_loader
  end

  # def printer
  #   @scores.each do |key, value|
  #     puts name_printer(key)
  #     hole_score_printer(value)
  #     puts "\n"

  #   end
  # end

  def name_printer(name)
    "==#{name}"
  end

  def hole_score_printer(scores)
    hole_number = 1
    scores.each do |score|
      puts "Hole #{hole_number}: #{score}#{result(hole_number-1, score.to_i)}"
      hole_number += 1
    end

  end

  # def result(array_index, score)
  #   par = @course[array_index].to_i
  #   if score == 1
  #     ' - Hole-in-One'
  #   elsif score-par == -2
  #     ' - Eagle'
  #   elsif score-par == -1
  #     ' - Birdie'
  #   elsif score == par
  #     ' - Par'
  #   elsif score-par == 1
  #     ' - Bogey'
  #   elsif score-par == 2
  #     ' - Double Bogey'
  #   elsif score-par == 3
  #     ' - Triple Bogey'
  #   else
  #     ''
  #   end
  # end

end

# golf = Golf.new
# golf.printer
