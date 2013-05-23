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

describe Golf do
  let(:round) {round = Golf.new}

  it 'prints name' do
    name = "Tiger Woods"
    expect(round.name_printer(name)).to include(name)
  end

  it 'outputs each player strokes per hole'
  it 'displays resulting score per hole'
  it 'calculates total score'

end

