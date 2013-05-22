require 'csv'

class CourseLayout
  attr_accessor :file_path, :course_layout_data

  def initialize(file_path = 'default_course_layout.csv')
    @file_path = file_path
  end

  def course_layout_data_loader
    course_layout = CSV.read(@file_path)[0]
  end

  def get_course_layout_data
    @course_layout_data = course_layout_data_loader
  end
end
