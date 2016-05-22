require 'nilsteps/resolution_error'

module Nilsteps
  module DSL
    def step_notes_for_pattern(pattern, note)
      pattern.chars.each_with_object({}).with_index do |(char, acc), index|
        acc[index] = note if char == 'o'
      end
    end

    def kick(pattern, length: 1, note: 'C1')
      raise ResolutionError unless valid_resolution?(pattern)
      steps = step_notes_for_pattern(pattern, note)
      Sequencer.play_on_the_fly(steps, length)
    end

    def snare(pattern, length: 1, note: 'D1')
      raise ResolutionError unless valid_resolution?(pattern)
      steps = step_notes_for_pattern(pattern, note)
      Sequencer.play_on_the_fly(steps, length)
    end

    def close_hihat(pattern, length: 1, note: 'F#1')
      raise ResolutionError unless valid_resolution?(pattern)
      steps = step_notes_for_pattern(pattern, note)
      Sequencer.play_on_the_fly(steps, length)
    end

    def open_hihat(pattern, length: 1, note: 'A#1')
      raise ResolutionError unless valid_resolution?(pattern)
      steps = step_notes_for_pattern(pattern, note)
      Sequencer.play_on_the_fly(steps, length)
    end

    def valid_resolution?(pattern)
      pattern.size % 16 == 0 ? true : false
    end
  end
end
