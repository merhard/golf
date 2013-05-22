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
      expect(course.course_layout_data_loader.size).to eql(18)
    end

  end

  describe 'course_layout_data_returner' do

    it 'returns all 18holes of data from file' do
      course.get_course_layout_data
      expect(course.course_layout_data.size).to eql(18)
    end

  end


end
