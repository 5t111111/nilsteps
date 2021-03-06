require 'osc-ruby'
require 'bpm_to_msec'

#
# Simple OSC client sequencer
#
module Nilsteps
  #
  # 16 steps / bar OSC sequencer for a track
  #
  class Sequencer
    def initialize(bpm: 120, length: 16, osc_server: 'localhost', osc_port: 2345)
      @bpm = self.class.bpm || bpm
      @osc_port = self.class.osc_port || osc_port
      @steps = Array.new(length)
      @resolution = 16 # Cannot change resolution for the moment
      @osc_client = OSC::Client.new(osc_server, @osc_port)
      @bpm_to_ms = BPMToMsec.new(bpm)
    end

    #
    # Setup notes in a secuence
    #
    # == Parameters:
    # notes::
    #   A hash for notes (e.g. { 0 => 'C1', 1 => 'D2', ... })
    #
    def setup_steps(notes)
      notes.each do |key, value|
        @steps[key.to_i] = OSC::Message.new('/' + value.to_s, 1)
      end
    end

    def note_length
      case @resolution
      when 1
        @bpm_to_ms.whole_note
      when 2
        @bpm_to_ms.half_note
      when 4
        @bpm_to_ms.quater_note
      when 8
        @bpm_to_ms.eighth_note
      when 16
        @bpm_to_ms.sixteenth_note
      when 32
        @bpm_to_ms.thirtysecond_note
      else
        @bpm_to_ms.sixteenth_note
      end
    end

    #
    # Play sequence
    #
    # == Parameters:
    # bars::
    #   Specify how many times it repeats a bar
    #
    def play(bars = 1)
      (1..bars).each do |_i|
        @steps.each do |step|
          if block_given?
            yield step if step
          else
            @osc_client.send(step) if step
          end
          sleep(note_length / 1000.0)
        end
      end
    end

    class << self
      attr_reader :bpm, :osc_port

      def play_on_the_fly(steps, length, times)
        seq = new
        seq.setup_steps(steps)
        seq.play(times)
      end

      def mutex
        @mutex ||= Mutex.new
      end

      def global_bpm(bpm)
        mutex.synchronize { @bpm = bpm }
      end

      def global_osc_port(osc_port)
        mutex.synchronize { @osc_port = osc_port }
      end

      def reset_global_bpm
        mutex.synchronize { @bpm = nil }
      end

      def reset_global_osc_port
        mutex.synchronize { @osc_port = nil }
      end
    end
  end
end
