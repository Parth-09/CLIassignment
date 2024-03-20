require 'minitest/autorun'
require './manager'

class TestTaskManager < Minitest::Test
  def test_to_s
    task = "Complete assignment"
    deadline = DateTime.new(2023, 3, 24, 14, 30).strftime('%Y-%m-%d %I:%M %p')
    task_manager = TaskManager.new(task, deadline)
    expected_string = "Complete assignment to be done by 2023-03-24 02:30 PM"
    assert_equal expected_string, task_manager.to_s, "TaskManager to_s method failed"
  end
end
