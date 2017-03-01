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

# Results: my_calculator.result would return the current result - it should be readonly.
    describe '.result' do
      it 'should return current result' do
        expect(@calculator.result).to eq(1)
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

end
