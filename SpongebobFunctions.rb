# CHALLENGE D: Use functions to optimize the SpongeBob theme!

use_bpm 136
use_synth :piano

define :two_eight do
  play:E4
  sleep 1
  play:E5
  play:Gs4
  sleep 2
  play:E5
  play:Gs4
  sleep 1
end

define :three_four_six do
  play :r
  sleep 1
  play:E5
  play:Gs4
  play:B4
  sleep 1
  play:B4
  sleep 1
  play:E5
  play:Gs4
  sleep 1
end

define :five_seven do
  play:B4
  sleep 0.75
  play:As4
  sleep 0.25
  play:Gs4
  play:B4
  sleep 0.75
  play:Cs5
  sleep 0.25
  play:B4
  sleep 1
  play:Gs4
  play:E5
  sleep 1
end

live_loop:background_notes do
  8.times do
    play:E3, amp: 0.25
    sleep 1
    play:B3, amp: 0.25
    play:E4, amp: 0.25
    sleep 1
    play:B3, amp: 0.25
    sleep 1
    play:E4, amp: 0.25
    sleep 1
  end
  stop
end

live_loop:drums do
  4.times do
    4.times do
      sample :drum_heavy_kick
      sleep 1
    end
  end
  4.times do
    4.times do
      sample :drum_snare_soft
      sleep 1
    end
  end
  stop
end

# Measure 1
play :r
sleep 1
play:E4
play:Gs4
sleep 2
play:E5
play:Gs4
sleep 1

# Measure 2
two_eight

# Measure 3
three_four_six

# Measure 4
three_four_six

# Measure 5
five_seven

# Measure 6
three_four_six

# Measure 7
five_seven

# Measure 8
two_eight

sample :drum_cymbal_closed, rate: -1, beat_stretch: 8, pitch: :E4
sleep 8
sample :drum_snare_hard
