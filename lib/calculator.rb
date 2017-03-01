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

  def add(x)
    raise TypeError unless x.is_a? Numeric
    @result += x
  end

  def subtract(x)
    raise TypeError unless x.is_a? Numeric
    @result -=x
  end

end
