require 'test_helper'

describe 'Nilsteps::DSL' do
  include Nilsteps::DSL

  it 'should set expected hash for notes' do
    step_notes_for_pattern('oxxxoxxxoxxxoxox', 'C1').must_equal(
      0 => 'C1',
      4 => 'C1',
      8 => 'C1',
      12 => 'C1',
      14 => 'C1'
    )
  end

  it 'raise error when passing unexpected resolution' do
    proc { kick 'oxox', length: 1 }.must_raise Nilsteps::ResolutionError
  end
end

