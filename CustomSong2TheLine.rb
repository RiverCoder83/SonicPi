#https://musescore.com/user/32197368/scores/21947812
use_bpm 143
theLine = "C:/Users/logan_benavente/Desktop/theLineSample.wav"
drumFx = [:none, :ring_mod, :rlpf, :normaliser]
drumSleeps = [2, 1, 1, 1, 2, 0.5]

define :the_line_notes do
  use_synth :piano
  # First measure
  play :c2, sustain: 4
  play :c3
  sleep 1
  play :g2
  sleep 1
  play :c3
  play :e3
  sleep 1
  play :c3
  sleep 1
  # Second measure
  play :e2
  play :c3
  sleep 1
  play :c3
  sleep 1
  play :c3
  play :g3
  sleep 1
  play :c3
  sleep 0.5
  play :c3
  sleep 0.5
  # Third measure
  play :e2, sustain: 4
  play :e3
  sleep 1
  play :b2
  sleep 1
  play :e3
  play :g3
  sleep 1
  play :e3
  sleep 1
  # Fourth measure
  play :g2
  play :b2
  sleep 1
  play :d3
  sleep 1
  play :d3
  play :g3
  sleep 1
  play :g2
  sleep 0.5
  play :g2
  sleep 0.5
end

define :drums do
  drumSleepTime = 0
  2.times do
    sample :drum_bass_soft
    sleep drumSleeps[drumSleepTime]
    drumSleepTime += 1
    sample :drum_bass_soft
    sleep drumSleeps[drumSleepTime]
    drumSleepTime += 1
    sample :drum_bass_hard
    sleep drumSleeps[drumSleepTime]
    drumSleepTime += 1
  end
  sample :drum_bass_hard
  sleep 0.5
end

# Sweep (parameterized function)
define :sweep do |note, beat_length, a|
  use_synth :dark_ambience
  play note, amp: a, sustain: beat_length, attack: 1.5
end

define :outro_notes do
  use_synth :piano
  # "My body's on the
  play :d4, sustain: 0.5
  sleep 0.5
  play :e4, sustain: 0.5
  sleep 0.5
  play :e4, sustain: 1.25
  sleep 1.25
  play :e4, sustain: 1.25
  sleep 1.25
  play :d4, sustain: 0.5
  sleep 0.5
  
  # line now"
  play :d4
  sleep 2
  play :c4
  sleep 2
  
  # "I can't fight this
  play :e5
  sleep 0.5
  play :e5
  sleep 1.5
  play :g5
  sleep 0.5
  play :g5
  sleep 1.5
  # time now"
  play :b4
  sleep 2
  play :a4
  sleep 2
end

# Intro sample
sample theLine, beat_stretch: 17, release: 12
sleep 17
# Intro Sweep
sweep :g4, 7, 4
sleep 7

# First sweep
sweep :c4, 16, 2
# Piano melody
live_loop :main_melody do
  3.times do
    the_line_notes
  end
  stop
end

sleep 16

# Bring drums in
effectNum = 0
live_loop :drum_beat do
  # Fx (array and incremented variable loop)
  4.times do
    with_fx drumFx[effectNum] do
      drums
    end
    effectNum += 1
  end
  stop
end

# Second sweep
sleep 16
sweep :e4, 8, 2
sleep 8
sweep :g4, 8, 1
sleep 8
# Sweeps transitioning to outro
sweep :a4, 4, 2
sleep 4
sample :drum_cymbal_closed, rate: -1, beat_stretch: 8, pitch: :a4, amp: 2
sleep 8

# Vocal melody fade out (outro)
ampVol = 1
3.times do
  with_fx :tremolo, amp: ampVol do
    outro_notes
    ampVol = ampVol - 0.4
  end
end
