require 'csv'

class CourseLayout
  attr_reader :file_path, :course_layout_data

  def initialize(file_path)
    @file_path = file_path
  end

  def course_layout_data_loader
    @course_layout_data = CSV.read(@file_path)[0]
  end
end
