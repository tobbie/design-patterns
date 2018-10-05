# Intent
# Ensure a class only has one Instance and provide a global point of access
# to it.

class Configuration
  @@instance = Configuration.new

  def self.instance
    puts @@instance
  end

  private_class_method :new
end

config = Configuration.instance
configur1 = Configuration.instance
