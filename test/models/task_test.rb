require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'title must be present' do
    task = Task.create(title: nil)
    assert task.errors[:title].any?
  end
  test 'user must be present' do
    task = Task.create(user: nil)
    assert task.errors[:user].any?
  end
end
