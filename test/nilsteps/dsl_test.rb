require 'test_helper'

describe 'Nilsteps::DSL' do
  include Nilsteps::DSL

  it 'should play expected steps with kick DSL' do
    mock = MiniTest::Mock.new
    mock.expect(:call, mock, [{ 0 => 'C1', 4 => 'C1', 8 => 'C1', 12 => 'C1' }, 1, 1])

    Nilsteps::Sequencer.stub(:play_on_the_fly, mock) do
      kick('oxxxoxxxoxxxoxxx')
    end

    mock.verify.must_equal true
  end

  it 'should play expected steps with snare DSL' do
    mock = MiniTest::Mock.new
    mock.expect(:call, mock, [{ 4 => 'D1', 12 => 'D1', 20 => 'D1', 28 => 'D1', 31 => 'D1'}, 2, 1])

    Nilsteps::Sequencer.stub(:play_on_the_fly, mock) do
      snare('xxxxoxxxxxxxoxxxxxxxoxxxxxxxoxxo')
    end

    mock.verify.must_equal true
  end

  it 'should play expected steps with close_hihat DSL' do
    mock = MiniTest::Mock.new
    mock.expect(:call, mock, [{ 0 => 'F#1', 16 => 'F#1', 32 => 'F#1' }, 3, 1])

    Nilsteps::Sequencer.stub(:play_on_the_fly, mock) do
      close_hihat('oxxxxxxxxxxxxxxxoxxxxxxxxxxxxxxxoxxxxxxxxxxxxxxx')
    end

    mock.verify.must_equal true
  end

  it 'should play expected steps with open_hihat DSL' do
    mock = MiniTest::Mock.new
    mock.expect(:call, mock, [{ 0 => 'A#1', 16 => 'A#1', 32 => 'A#1', 48 => 'A#1' }, 4, 1])

    Nilsteps::Sequencer.stub(:play_on_the_fly, mock) do
      open_hihat('oxxxxxxxxxxxxxxxoxxxxxxxxxxxxxxxoxxxxxxxxxxxxxxxoxxxxxxxxxxxxxxx')
    end

    mock.verify.must_equal true
  end

  it 'raise error when passing unexpected resolution' do
    proc { kick 'oxox', times: 1 }.must_raise Nilsteps::ResolutionError
  end
end

