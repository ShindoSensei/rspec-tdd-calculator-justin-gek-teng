class Calculator
  # your class goes here
attr_reader :result
#Need to include result_array ????

  def initialize(result)
    @result = result
    @result_array =[]
    @can_redo = false
  end

  def result
    @result
  end

  def reset(x)
      @result = x
      @result_array=[]
  end

  def add(x)

      raise TypeError unless x.is_a? Numeric
      @result += x
      @result_array.push(@result)
      @can_redo = false
    self
  end

  def subtract(x)

      raise TypeError unless x.is_a? Numeric
      @result -=x
      @result_array.push(@result)
      @can_redo = false
      self
  end

  def multiply(x)

      raise TypeError unless x.is_a? Numeric
      @result *= x
      @result_array.push(@result)
      @can_redo = false
      self
  end

  def divide(x)

      raise TypeError unless x.is_a? Numeric
      @result /= x
      @result_array.push(@result)
      @can_redo = false
    self
  end

  def operation(op,x)
    raise TypeError unless x.is_a? Numeric
    if op == 'add'
      add(x)
    elsif op == 'subtract'
      subtract(x)
    elsif op == 'multiply'
      multiply(x)
    elsif op == 'divide'
      divide(x)
    end
    self
  end

  def undo
    @can_redo = true
    @result = @result_array[-2]
  end

  def redo
    if @can_redo
    @result = @result_array[-1]
    end
  end
end
