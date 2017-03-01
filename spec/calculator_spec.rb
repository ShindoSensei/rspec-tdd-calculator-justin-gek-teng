require_relative 'spec_helper'
require_relative '../lib/calculator'

describe Calculator do
  before(:context) do
    # initialize calculator
    @calculator = Calculator.new(1)
  end
  describe 'Initialization' do
      it 'is an instance of the Calculator class' do
        expect(@calculator).to be_instance_of(Calculator)
      end
  end

  describe 'Accessors' do
    it 'should get result' do
      expect(@calculator.result).to eq(1)
    end

    it 'should not set result' do
      @calculator.result = 5 if respond_to? :result=   #Trying to set result to 5 here, and if there is a response to :result= method, we expect @calculator.result to still be 1,i.e. unchanged.
      expect(@calculator.result).to eq(1)
    end
  end

# Results: my_calculator.result would return the current result - it should be readonly.
    describe 'Methods' do
      it 'should return current result' do
        expect(@calculator.result).to eq(1)
      end

      it 'should reset calculator to input value' do
        @calculator.reset(0)
        expect(@calculator.result).to eq(0)
      end
      # Addition: my_calculator.add(x) would add x to the internal result value, if x can be a valid number

      it 'Input should be a valid num' do
        #If x is a valid number, perform below
        expect{@calculator.add('abc')}.to raise_error(TypeError)
        expect{@calculator.subtract('abc')}.to raise_error(TypeError)
        expect{@calculator.multiply('abc')}.to raise_error(TypeError)
        expect{@calculator.divide('abc')}.to raise_error(TypeError)
      end

      it 'should add x to internal result value' do
        @calculator.add(2)
        expect(@calculator.result).to eq(2)
      end


      it 'should add x to internal result value' do
        @calculator.subtract(1)
        expect(@calculator.result).to eq(1)
      end

# Multiply: my_calculator.multiply(x) would multiply x by the internal result value and save the new value, if x can be a valid number
      it 'should multiply x to internal result value' do
        @calculator.multiply(2)
        expect(@calculator.result).to eq(2)
      end

      it 'should divide internal result value by x' do
        @calculator.divide(2)
        expect(@calculator.result).to eq(1)
      end

# Chain: my_calculator.add(x).subtract(y) all methods should be chainable in any order
      it 'should allow chaining of methods' do
        @calculator.multiply(2).divide(2).add(2).subtract(1)
        expect(@calculator.result).to eq(2)
      end

      # Operation: my_calculator.operation('add', x) would apply the addition operation with the value of x. It should support all operations
      it 'should support all operations and apply them appropriately' do
        @calculator.operation('add',2)
        @calculator.operation('subtract',1)
        @calculator.operation('multiply',2)
        @calculator.operation('divide',2)
        expect(@calculator.result).to eq(3)  #AT THIS POINT IT IS 3
      end

# Undo: my_calculator.undo should undo the previous operation, restoring the result value.
      it 'should undo the previous operation, restoring the result value' do
        @calculator.operation('subtract',1)
        expect(@calculator.undo).to eq(3) #WE ARE AT 3
      end

      it 'should redo the previous operation, restoring the result value' do
        @calculator.redo
        expect(@calculator.result).to eq(2) #WE ARE AT 2
        # If a new action is executed it should remove the ability to perform redos.
      end

      it 'should remove ability to perform redos after new action is executed' do
        @calculator.add(2)
        @calculator.redo
        expect(@calculator.result).to eq(4)
      end

    end

end
