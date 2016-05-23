# Nilsteps

Nilsteps is an OSC client sequecer for 16 steps / bar, only single track is available for the moment. You need OSC server compatible instruments to hear generated sound.

__This is just a proof of concept as it does not care about the overhead. The specified BPM is not guaranteed at all.__

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nilsteps'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nilsteps

## Usage

```ruby
# C1 for 1st note and D1 for 8th note of 16 steps in a bar
seq = Nilsteps::Sequencer.new(bpm: 128)
seq.setup_steps(0 => 'C1', 8 => 'D1')
seq.play(4)

# Drum machine like sequence DSL
include Nilsteps::DSL

kick 'oxxxoxxxoxxxoxox', times: 1
```
