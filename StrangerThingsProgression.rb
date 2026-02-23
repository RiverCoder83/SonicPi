# Challenge B Stranger Things
use_bpm 160
sample :ambi_choir, beat_stretch: 8, pitch: 3, amp: 2

sleep 8

live_loop :drums do
  sample :drum_heavy_kick, amp: 1.3
  sleep 2
  2.times do
    sample :drum_heavy_kick, amp: 1.3
    sleep 1
  end
end

sleep 8

live_loop :main_theme do
  use_synth :pulse
  
  # First set of eighth notes
  play :c3, amp: 0.5
  sleep 0.5
  play :e3, amp: 0.5
  sleep 0.5
  play :g3, amp: 0.5
  sleep 0.5
  play :b3, amp: 0.5
  sleep 0.5
  # Second set of eighth notes
  play :c4, amp: 0.5
  sleep 0.5
  play :b3, amp: 0.5
  sleep 0.5
  play :g3, amp: 0.5
  sleep 0.5
  play :e3, amp: 0.5
  sleep 0.5
end

sleep 8

live_loop :underscore do
  use_synth :bass_foundation
  
  # Piano underscore
  8.times do
    play :e2, amp: 1
    sleep 0.5
  end
  8.times do
    play :c2, amp: 1
    sleep 0.5
  end
  8.times do
    play :g2, amp: 1
    sleep 0.5
  end
  8.times do
    play :b2, amp: 1
    sleep 0.5
  end
end

sleep 8

live_loop :crash do
  sample :loop_industrial, amp: 0.2, beat_stretch: 4
  sleep 4
end
