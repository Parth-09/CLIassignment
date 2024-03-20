require_relative "task_manager"
require 'date'

class Manager
  def initialize
    @tasks = []
  end

  # Gets the task from user
  def get_task
    task = ""
    loop do
      print "\nPlease enter the task you want to do: "
      task = gets.chomp
      # will not accept an empty string
      break unless task.empty?
  
      puts "Task cannot be blank. Please enter a valid task."
    end
  
    task
  end
  
  # gets the deadline from the user for task completion
  def get_deadline
    deadline_input = nil
    loop do
      puts "\nPlease enter the deadline for the task (Format: YYYY-MM-DD HH:MM AM/PM):"
      deadline = gets.chomp

      # checks if the date string is valid
      begin
        deadline_input = DateTime.strptime(deadline, '%Y-%m-%d %I:%M %p')
        break
      rescue ArgumentError
        puts "Invalid date format. Please enter the deadline in the correct format."
      end
    end

    deadline_input
  end

  # works as a helped function for combing the get taks and deadline
  def add_task
    task = get_task
    deadline = get_deadline
    # adding the task to the object which is an array
    @tasks << TaskManager.new(task, deadline.strftime('%Y-%m-%d %I:%M %p'))
  end

  # prints the list of tasks
  def list_tasks

    if @tasks.empty?
      print "\n"
      puts "No tasks added yet."
      return
    end

    print "\n"
    puts "Here are your current tasks and their deadlines:"
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}\n"
    end
  end

  # main function
  def run
    loop do
      print "\n"
      puts "What would you like to do?(Give an input as 1, 2 or 3)\n1. Add a Task\n2. View Your Tasks\n3. Exit\n"
      print "Enter input here: "
      input = gets.chomp.to_i

      case input
      when 1
        add_task
      when 2
        list_tasks
      when 3
        puts "Exiting Task Manager."
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end
end
