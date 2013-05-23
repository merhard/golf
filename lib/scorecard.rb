require 'csv'

class Scorecard
  attr_accessor :file_path, :player_scores

  def initialize(file_path = 'default_scorecard.csv')
    @file_path = file_path
  end

  def scorecard_data_loader
    @player_scores = {}

    CSV.foreach(@file_path) do |row|
      @player_scores["#{row[0]}, #{row[1]}"] = row[2..19]
    end

    @player_scores
  end


end
