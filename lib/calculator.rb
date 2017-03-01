class Calculator
  # your class goes here
attr_reader :result

  def initialize(result)
    @result = result
  end

  def result
    @result
  end

  def reset(x)
      @result = x
  end
end
