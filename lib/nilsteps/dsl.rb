require 'nilsteps/resolution_error'

module Nilsteps
  module DSL
    def kick(pattern, times: 1, note: 'C1')
      DSL.play_dsl(pattern, times, note)
    end

    def snare(pattern, times: 1, note: 'D1')
      DSL.play_dsl(pattern, times, note)
    end

    def close_hihat(pattern, times: 1, note: 'F#1')
      DSL.play_dsl(pattern, times, note)
    end

    def open_hihat(pattern, times: 1, note: 'A#1')
      DSL.play_dsl(pattern, times, note)
    end

    class << self
      def step_notes_for_pattern(pattern, note)
        pattern.chars.each_with_object({}).with_index do |(char, acc), index|
          acc[index] = note if char == 'o'
        end
      end

      def valid_resolution?(pattern)
        pattern.size % 16 == 0 ? true : false
      end

      def play_dsl(pattern, times, note)
        raise ResolutionError unless DSL.valid_resolution?(pattern)
        steps = DSL.step_notes_for_pattern(pattern, note)
        Sequencer.play_on_the_fly(steps, pattern.size / 16, times)
      end
    end
  end
end
