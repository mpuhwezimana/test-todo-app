require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
   it 'should mark all tasks from the list as complete' do
     list = List.create(name: "Chores")
     Task.create(complete: false, list_id: list.id, name: "Take out trash")
     Task.create(complete: false, list_id: list.id, name: "Mow the lawn")
     list.complete_all_tasks!
     list.tasks.each do |task|
       expect(task.complete).to eq(true)
     end
    end
  end

  describe '#snooze_all_tasks!' do
   it 'should snooze the tasks deadlines by an hour' do
     list = List.create(name: "Chores")
     deadline = DateTime.new
     Task.create(deadline: deadline, list_id: list.id, name: "Praying")
     list.snooze_all_tasks!
     list.tasks.each do |task|
       expect(task.deadline).to eq(deadline + 1.hour)
     end
    end
  end

  describe '#incomplete_tasks' do
   it 'should return the array of incomplete tasks' do
     list = List.create(name: "Chores")
     Task.create(complete: false, list_id: list.id, name: "Visiting Sandrine")
     Task.create(complete: false, list_id: list.id, name: "Visiting Marlene")
     Task.create(complete: true, list_id: list.id, name: "Visiting Karanga")
     list.incomplete_tasks.each do |task|
       expect(task.complete).to eq(false)
     end
    end
  end
end