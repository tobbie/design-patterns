# Intent
# Compose objects into tree structures to represent part-whole hierarchies.
# Composite lets clients treat individual objects and compositions of objects
# uniformly.

class Task
  attr_accessor :name, :parent

  def initialize(name)
    p "Entering #{name}"
    @name = name
    @parent =  nil
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    p "adding sub task"
    @sub_tasks << task
    task.parent = self
  end

  def remove_sub_task(task)
    p "removing the sub task"
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.get_time_required }
    time
  end
end

class AddDryIngredientsTask < Task
  def initialize
    super("Add dry ingredients")
  end

  def get_time_required
    1.0
  end
end

class MixTask < Task
  def initialize
    super( "Mix up batter")
  end

  def get_time_required
    3.0
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make Batter')
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(MixTask.new)
  end
end

batter = MakeBatterTask.new
p batter.get_time_required
