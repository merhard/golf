require 'rspec'

require_relative '../lib/golf'

describe CourseLayout do
  let(:course) {course = CourseLayout.new}

  it "accepts a file path" do
    file_path = "/fake/file/path.csv"
    layout = CourseLayout.new(file_path)
    expect(layout.file_path).to be file_path
  end

  describe 'course_layout_data_loader' do

    it 'loads all 18holes of data from file' do
      course_layout_data = course.course_layout_data_loader
      expect(course_layout_data.size).to eql(18)
    end

  end

end

describe Scorecard do
  let(:scorecard) {scorecard = Scorecard.new}

  it "accepts a file path" do
    file_path = "/fake/file/path.csv"
    card = Scorecard.new(file_path)
    expect(card.file_path).to be file_path
  end

  describe 'scorecard_data_loader' do

    it 'loads all players from file' do
      player_scores = scorecard.scorecard_data_loader
      expect(player_scores.size).to eql(2)
    end

    it 'loads all 18holes of data from file' do
      player_scores = scorecard.scorecard_data_loader
      expect(player_scores.values[0].size).to eql(18)
    end

  end

end

describe ScorecardPrinter do
  let(:printer) do
    test_scores_array = [1,2,3]
    test_course_array = [1,2,3]
    printer = ScorecardPrinter.new(test_scores_array, test_course_array)
  end


  it 'accepts scores and a course' do
    test_scores = [6, 5, 4]
    test_course = [3, 2, 1]
    printer = ScorecardPrinter.new(test_scores, test_course)
    expect(printer.scores_array).to eql([6, 5, 4])
    expect(printer.course).to eql([3, 2, 1])
  end


  describe 'print_scoreboard' do

    it 'prints the scoreboard'

    it 'returns a list of players and their total scores'

  end


  describe 'name_printer' do

    it 'prints name' do
      name = "Tiger Woods"
      expect(printer.name_printer(name)).to include(name)
    end

  end


  describe 'hole_score_printer_iterator' do

    it 'iterates through all hole scores' do
      test_array = [1,2,3]
      number_of_holes = printer.hole_score_printer_iterator(test_array)
      expect(number_of_holes).to eql(3)
    end

  end


  describe 'hole_score_stringifier' do

    it 'stringifies hole scores' do
      hole_number = 5
      score = 2
      string = printer.hole_score_stringifier(hole_number, score)
      expect(string).to include('Hole 5: 2')
    end

  end


  describe 'result' do

    it 'displays hole-in-ones' do
      score = 1
      par = 5
      result_string = printer.result(score, par)
      expect(result_string).to include('Hole-in-One')
    end

    it 'displays eagles' do
      score = 2
      par = 4
      result_string = printer.result(score, par)
      expect(result_string).to include('Eagle')
    end

    it 'displays birdies' do
      score = 3
      par = 4
      result_string = printer.result(score, par)
      expect(result_string).to include('Birdie')
    end

    it 'displays pars' do
      score = 4
      par = 4
      result_string = printer.result(score, par)
      expect(result_string).to include('Par')
    end

    it 'displays bogies' do
      score = 5
      par = 4
      result_string = printer.result(score, par)
      expect(result_string).to include('Bogey')
    end

    it 'displays double bogies' do
      score = 6
      par = 4
      result_string = printer.result(score, par)
      expect(result_string).to include('Double Bogey')
    end

    it 'displays triple bogies' do
      score = 7
      par = 4
      result_string = printer.result(score, par)
      expect(result_string).to include('Triple Bogey')
    end

    it 'displays nothing if worse than triple bogey' do
      score = 8
      par = 4
      result_string = printer.result(score, par)
      expect(result_string).to eql('')
    end

  end


  describe 'total_score' do

    it 'calculates total score' do
      test_scores = [1,2,3]
      score = printer.total_score(test_scores)
      expect(score).to eql(6)
    end

  end


  describe 'par_for_the_course' do

    it 'calculates par for the course' do
      test_course = [1,2,3]
      par = printer.par_for_the_course(test_course)
      expect(par).to eql(6)
    end

  end


  describe 'distance_from_par' do

    it 'calculates distance from par' do
      score = 3
      par = 4
      distance = printer.distance_from_par(score, par)
      expect(distance).to eql(-1)
    end

  end

end

describe LeaderboardPrinter do
  let(:leaderboard) {leaderboard = LeaderboardPrinter.new}

  describe 'sort_leaderboard' do

    it 'sorts the golfers by score'

  end


  describe 'print_leaderboard' do

    it 'prints the leaderboard'

  end

end

describe Golf do
  let(:golf) {golf = Golf.new}

  it ''


  describe 'printer' do

    it ''

  end

end



























