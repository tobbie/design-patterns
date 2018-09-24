# Intent
# Avoid coupling the sender of a request to its receiver by giving more than
# one object a chance to handle the request. Chain the receiving objects and
# pass the request along the chain until an object handles it.

class QuestionHandler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def process_request(request)
    if accept_request(request)
      return
    elsif @successor
      @successor.process_request(request)
    else
      fail_request(request)
    end
  end

  def fail_request(request)
    puts "The '#{request}' could not be handled"
  end

  def accept_request(request)
    raise "#accept_request must be implemented"
  end
end

class HitchHikersGuideQuestionHandler < QuestionHandler
  def accept_request(request)
    if request.include?("Hitch Hiker's Guide")
      answer_question(request)
      return true
    else
      return false
    end
  end

  def answer_question(request)
    puts "Answering a Hitch Hiker's Guide related question"
  end
end

class HarryPotterQuestionHandler < QuestionHandler
  def accept_request(request)
    if request.include?("Harry Potter")
      answer_question(request)
      return true
    else
      return false
    end
  end

  def answer_question(request)
    puts "Answering a Harry Potter related question"
  end
end

chain_of_responsibility = HitchHikersGuideQuestionHandler.new(
  HarryPotterQuestionHandler.new
)

chain_of_responsibility.process_request("Who is Harry Potter best friend?")
chain_of_responsibility.process_request("What is the Avengers about?")
chain_of_responsibility.process_request("Why are there 7 Hitch Hiker's Guide?")