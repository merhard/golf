require 'csv'

class Scorecard
  attr_reader :file_path, :player_scores

  def initialize(file_path)
    @file_path = file_path
  end

  def scorecard_data_loader
    @player_scores = {}

    CSV.foreach(@file_path) do |row|
      row.map! { |x| x.strip  }

      @player_scores["#{row[1]} #{row[0]}"] = row[2..19]
    end

    @player_scores
  end

end
