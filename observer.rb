# Intent
# Define a one-to-many dependency between objects so that when one object
# changes state, all of its dependents are notified and updated automatically.

class Subject
  attr_accessor :name

  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Observer
  def update(changed_subject)
    puts "The subject has changed."
  end
end

observer_a = Observer.new
observer_b = Observer.new
subject = Subject.new
subject.name = "Anakin Skywalker"

subject.add_observer(observer_a)
subject.add_observer(observer_b)


subject.name = "Obi Wan Kenobi"
subject.notify_observers