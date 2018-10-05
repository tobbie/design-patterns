# Intent
# Given a language, define a representation for its grammar along with an
# interpreter that uses the representation to interpret sentences in the language.

require 'find'

class AbstractExpression
  def interpret(context)
    raise NotImplementedError, "interpret() must be defined in subclass"
  end
end

class TerminalExpression < AbstractExpression
  def interpret(context)
    puts "Inside TerminalExpression"
  end
end

class NonTerminalExpression < AbstractExpression
  def interpret(context)
    puts "NonTerminalExpression"
  end
end

class Context
  def initialize(value)
    @expression = value
  end

  def set_expression(value)
    @expression = value
  end

  def get_expression
    @expression
  end
end

context_object = Context.new("AAABBBCCCDDD")
expression_list = Array.new
expression_list << TerminalExpression.new
expression_list << NonTerminalExpression.new
expression_list << TerminalExpression.new

for expression in expression_list
  expression.interpret(context_object)
end
p context_object.get_expression
