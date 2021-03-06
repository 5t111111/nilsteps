require 'test_helper'

describe 'Nilsteps::Sequencer' do
  it 'can have global BPM' do
    Nilsteps::Sequencer.global_bpm(80)
    Nilsteps::Sequencer.bpm.must_equal 80
    Nilsteps::Sequencer.new.instance_variable_get(:@bpm).must_equal 80
    Nilsteps::Sequencer.new(bpm: 100).instance_variable_get(:@bpm).must_equal 80
  end

  it 'can reset global BPM' do
    Nilsteps::Sequencer.global_bpm(80)
    Nilsteps::Sequencer.bpm.must_equal 80
    Nilsteps::Sequencer.new.instance_variable_get(:@bpm).must_equal 80
    Nilsteps::Sequencer.reset_global_bpm
    Nilsteps::Sequencer.bpm.must_equal nil
    Nilsteps::Sequencer.new(bpm: 100).instance_variable_get(:@bpm).must_equal 100
  end

  it 'can have global OSC port' do
    Nilsteps::Sequencer.global_osc_port(33333)
    Nilsteps::Sequencer.osc_port.must_equal 33333
    Nilsteps::Sequencer.new.instance_variable_get(:@osc_port).must_equal 33333
    Nilsteps::Sequencer.new(osc_port: 3456).instance_variable_get(:@osc_port).must_equal 33333
  end

  it 'can reset global OSC port' do
    Nilsteps::Sequencer.global_osc_port(33333)
    Nilsteps::Sequencer.osc_port.must_equal 33333
    Nilsteps::Sequencer.new.instance_variable_get(:@osc_port).must_equal 33333
    Nilsteps::Sequencer.reset_global_osc_port
    Nilsteps::Sequencer.osc_port.must_equal nil
    Nilsteps::Sequencer.new(osc_port: 3456).instance_variable_get(:@osc_port).must_equal 3456
  end
end
