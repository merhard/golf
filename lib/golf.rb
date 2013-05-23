require_relative 'course_layout'
require_relative 'scorecard'


class Golf

  def initialize
    course_layout = CourseLayout.new
    @course = course_layout.course_layout_data_loader

    scorecard = Scorecard.new
    @scores_array = scorecard.scorecard_data_loader
  end

  def printer
    @scores_array.each do |key, value|
      puts name_printer(key)

      hole_score_printer_iterator(value)

      puts "\nTotal score: #{total_score(value)}"

      score = total_score(value)
      par = par_for_the_course(@course)
      puts "#{distance_from_par(score, par)}"

      puts "==\n\n"
    end
  end

  def name_printer(name)
    "==#{name}"
  end

  def hole_score_printer_iterator(scores)
    hole_number = 0

    scores.each do |score|
      hole_number += 1
      puts hole_score_stringifier(hole_number, score)
    end

    hole_number
  end

  def hole_score_stringifier(hole_number, score)
    par = @course[hole_number-1]
    "Hole #{hole_number}: #{score}#{result(score.to_i, par.to_i)}"
  end

  def result(score, par)

    if score == 1
      ' - Hole-in-One'
    else
      result_name = score - par

      case result_name
      when -2
        ' - Eagle'
      when -1
        ' - Birdie'
      when 0
        ' - Par'
      when 1
        ' - Bogey'
      when 2
        ' - Double Bogey'
      when 3
        ' - Triple Bogey'
      else
        ''
      end

    end

  end

  def total_score(scores)
    total_score_value = 0

    scores.each do |score|
      total_score_value += score.to_i
    end

    total_score_value
  end

  def par_for_the_course(course_layout)
    total_par_value = 0

    course_layout.each do |par|
      total_par_value += par.to_i
    end

    total_par_value
  end

  def distance_from_par(score, par)
    distance = score - par
  end

end

# golf = Golf.new
# golf.printer
