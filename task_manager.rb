class TaskManager
  attr_accessor :task, :deadline

  def initialize(task, deadline)
    @task = task
    @deadline = deadline
  end

  def to_s
    "#{@task.downcase.capitalize} to be done by #{@deadline}"
  end
end
