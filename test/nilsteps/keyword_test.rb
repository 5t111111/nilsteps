require 'test_helper'

describe 'Nilsteps::Keyword' do
  include Nilsteps::Keyword

  it 'should know if method name is bar keyword' do
    bar1_1.must_equal 1
    bar1_16.must_equal 16
    bar2_1.must_equal 17
    bar2_16.must_equal 32
    bar11_10.must_equal 170
    proc { foo1_1 }.must_raise NameError
    proc { barA_1 }.must_raise NameError
    proc { bar1_A }.must_raise NameError
    proc { bar1_1a }.must_raise NameError
    proc { _bar1_1 }.must_raise NameError
  end
end
