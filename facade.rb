# Intent
# Provide a unified interface to a set of interfaces in a subsystem.
# Facade defines a higher-level interface that makes the subsystem easier to use.

class SubSystemClass1
  def subsystem_class_method_1
    puts "Using SubSystemClass1:subsystem_class_method_1"
  end

  def subsystem_class_method_2
    puts "Using SubSystemClass1:subsystem_class_method_2"
  end
end

class SubSystemClass2
  def subsystem_class_method_1
    puts "Using SubSystemClass2:subsystem_class_method_1"
  end

  def subsystem_class_method_2
    puts "Using SubSystemClass2:Ssubsystem_class_method_2"
  end
end

class SubSystemClass3
  def subsystem_class_method_1
    puts "Using SubSystemClass3:subsystem_class_method_1"
  end

  def subsystem_class_method_2
    puts "Using SubSystemClass3:subsystem_class_method_2"
  end
end

class FacadeSystem
  def initialize
    @subSysClass1 = SubSystemClass1.new
    @subSysClass2 = SubSystemClass2.new
    @subSysClass3 = SubSystemClass3.new
  end
  
  def method_1
    puts "Using FacadeSystem:Method1()"
    @subSysClass1.subsystem_class_method_1
    @subSysClass2.subsystem_class_method_2
    @subSysClass3.subsystem_class_method_1
  end

  def method_2
    puts "Using FacadeSystem:Method2()"
    @subSysClass1.subsystem_class_method_2
    @subSysClass2.subsystem_class_method_1
    @subSysClass3.subsystem_class_method_2
  end
end

facade = FacadeSystem.new
facade.method_1
facade.method_2