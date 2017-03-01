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

    describe '.reset' do
      it 'should reset calculator to input value' do
        @calculator.reset(0)
        expect(@calculator.result).to eq(0)
      end
    end

    describe 'check input' do
      it 'Input should be a valid num' do
        #If x is a valid number, perform below
        expect{@calculator.add('abc')}.to raise_error(TypeError)
        expect{@calculator.subtract('abc')}.to raise_error(TypeError)
        expect{@calculator.multiply('abc')}.to raise_error(TypeError)
        expect{@calculator.divide('abc')}.to raise_error(TypeError)
      end
    end

      describe '.add' do
        it 'should add x to internal result value' do
          @calculator.add(2)
          expect(@calculator.result).to eq(2)
        end
      end

      describe '.subtract' do
        it 'should add x to internal result value' do
          @calculator.subtract(1)
          expect(@calculator.result).to eq(1)
        end
      end

      describe '.multiply' do
        it 'should multiply x to internal result value' do
          @calculator.multiply(2)
          expect(@calculator.result).to eq(2)
        end
      end

      describe '.divide' do
        it 'should divide internal result value by x' do
          @calculator.divide(2)
          expect(@calculator.result).to eq(1)
        end
      end

      describe '.chain' do
        it 'should allow chaining of methods' do
          @calculator.multiply(2).divide(2).add(2).subtract(1)
          expect(@calculator.result).to eq(2)
        end
      end

      describe '.operation(op,x)' do
        it 'should support all operations and apply them appropriately' do
          @calculator.operation('add',2)
          @calculator.operation('subtract',1)
          @calculator.operation('multiply',2)
          @calculator.operation('divide',2)
          expect(@calculator.result).to eq(3)  #AT THIS POINT IT IS 3
        end
      end

      describe '.undo' do
        it 'should undo the previous operation, restoring the result value' do
          @calculator.operation('subtract',1)
          expect(@calculator.undo).to eq(3) #WE ARE AT 3
        end
      end

      describe '.redo' do
        it 'should redo the previous operation, restoring the result value' do
          @calculator.redo
          expect(@calculator.result).to eq(2) #WE ARE AT 2
          # If a new action is executed it should remove the ability to perform redos.
        end
      end

      describe '.redo ability removed after new action executed' do
        it 'should remove ability to perform redos after new action is executed' do
          @calculator.add(2)
          @calculator.redo
          expect(@calculator.result).to eq(4)
        end
      end
end
