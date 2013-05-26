require 'rspec'

require_relative '../lib/golf'

describe CourseLayout do
  let(:course) do
    file_path = 'default_course_layout.csv'
    course = CourseLayout.new(file_path)
  end

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
  let(:scorecard) do
    file_path = 'default_scorecard.csv'
    scorecard = Scorecard.new(file_path)
  end

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
    test_scores_hash = {"Player1"=>[1,2,3], "Player2"=>[4,5,6]}
    test_course_array = [3,4,5]
    printer = ScorecardPrinter.new(test_scores_hash, test_course_array)
  end


  it 'accepts scores and a course' do
    test_scores = {"Player"=>[6, 5, 4]}
    test_course = [3, 2, 1]
    printer = ScorecardPrinter.new(test_scores, test_course)
    expect(printer.scores_hash).to eql({"Player"=>[6, 5, 4]})
    expect(printer.course).to eql([3, 2, 1])
  end


  describe 'print_scoreboard' do

    it 'returns a list of players, their total scores, and their distance from par' do
      player1_score = 1 + 2 + 3
      player2_score = 4 + 5 + 6
      player1_distance = 1-3 + 2-4 + 3-5
      player2_distance = 4-3 + 5-4 + 6-5

      expect(printer.print_scoreboard).to eql({"Player1"=>{:score=>player1_score, :distance=>player1_distance}, "Player2"=>{:score=>player2_score, :distance=>player2_distance}})
    end

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
  let(:unsorted_leaderboard) {unsorted_leaderboard = {"Player1"=>{:score=>2},
                              "Player2"=>{:score=>1}}}


  describe 'sort_leaderboard' do

    it 'sorts the golfers by score' do
      sorted_leaderboard = leaderboard.sort_leaderboard(unsorted_leaderboard)

      expect(sorted_leaderboard[0][0]).to eql('Player2')
      expect(sorted_leaderboard[1][0]).to eql('Player1')
    end

  end


  describe 'print_leaderboard' do

    it 'prints all golfers on leaderboard' do
      number_of_golfers = leaderboard.print_leaderboard(unsorted_leaderboard)

      expect(number_of_golfers).to eql(2)
    end

  end

end

describe Golf do
  let(:golf) {golf = Golf.new}

  it "accepts two file paths" do
    file_path1 = "/fake/file/path1.csv"
    file_path2 = "/fake/file/path2.csv"

    golf = Golf.new(file_path1, file_path2)

    expect(golf.course_file).to be file_path1
    expect(golf.scores_file).to be file_path2
  end


  describe 'course_layout' do

    it 'returns information from course file' do
      #using default_course_layout.csv
      course_info = golf.course_layout
      expected_return = ["4","5","4","3","4","3","4","5","4","4","4","3","5","4","5","3","4","4"]

      expect(course_info).to eql(expected_return)
    end

  end


  describe 'scorecard' do

    it 'returns information from scorecard file' do
      #using default_scorecard.csv
      scorecard_info = golf.scorecard
      expected_return = {"Tiger Woods"=>["4","4","3","3","3","1","3","3","4","3","4","3","5","4","8","3","8","4"],
                          "Sergio Garcia"=>["5","5","4","3","4","3","5","4","4","4","6","2","4","5","5","2","4","4"]}

      expect(scorecard_info).to eql(expected_return)
    end

  end

end


























