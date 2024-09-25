require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "should raise error when saving student without first name" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(school_email: "jokic@msudenver.edu", major: "CS", minor: "CS")
    end
  end

  test "should raise error when saving student without an email" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(name: "Nikola", major: "CS", minor: "CS")
    end
  end

  test "should raise error when saving student without major" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(name: "Nikola", school_email: "jokic@msudenver.edu", minor: "CS")
    end
  end

  test "should raise error when saving student without minor" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(name: "Nikola", school_email: "jokic@msudenver.edu", major: "CS")
    end
  end
end
