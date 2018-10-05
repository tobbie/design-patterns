# Intent
# Convert the interface of a class into another interface clients expect.
# Adapter lets classes work together that could not otherwise because of
# incompatible interfaces

class Hammer
  def swing
    p 'Hit a nail'
  end
end

class Tool
  def initialize(adapter)
    @adapter = adapter
  end

  def use_tool
    @adapter.use_tool
  end
end

class ToolAdapter
  def initialize(tool)
    @tool = tool
  end

  def use_tool
    @tool.swing
  end
end


hammer = Hammer.new
tool_adapter = ToolAdapter.new(hammer)
tool = Tool.new(tool_adapter)

tool.use_tool
