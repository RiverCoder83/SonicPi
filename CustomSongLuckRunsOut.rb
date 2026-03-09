# Luck Runs Out "remix"

# BPM
use_bpm 110

# ALNST sample
rulerOfMyHeart = "C:/Users/logan_benavente/Desktop/rulerOfMyHeart.wav"

define :main_melody do
  # First set of notes
  2.times do
    play :Df4, amp: 0.7
    sleep 0.5
    play :Af3, amp: 0.7
    sleep 0.5
    play :Ef4, amp: 0.7
    sleep 0.5
    play :Af3, amp: 0.7
    sleep 0.5
  end
  # Second set of notes
  2.times do
    play :C4, amp: 0.7
    sleep 0.5
    play :Af4, amp: 0.7
    sleep 0.5
    play :Ef4, amp: 0.7
    sleep 0.5
    play :Af4, amp: 0.7
    sleep 0.5
  end
end

live_loop :treble_clef do
  use_synth :tri
  4.times do
    main_melody
  end
  stop
end

sleep 8

# Drums
live_loop :drums do
  3.times do
    3.times do
      sample :drum_bass_hard
      sleep 2
    end
    sample :drum_tom_mid_soft
    sleep 1
    sample :drum_tom_mid_soft
    sleep 1
  end
  stop
end

#Harmonizing notes
live_loop :bass_clef do
  use_synth :piano
  3.times do
    play :Df2
    play :A2
    play :F2
    sleep 4
    play :F2, sustain: 1.5
    play :G2, sustain: 1.5
    sleep 1.5
    play :Ef2, sustain: 0.25
    play :Bf2, sustain: 0.25
    sleep 0.5
    play :F2
    play :G2
    sleep 2
  end
  stop
end

sleep 8

live_loop :choir_and_synth do
  2.times do
    use_synth :bass_foundation
    sample :ambi_choir, beat_stretch: 4, pitch: :Df2, amp: 0.5
    play :Df2, amp: 0.85
    sleep 4
    sample :ambi_choir, beat_stretch: 4, pitch: :C3, amp: 0.5
    play :C3, amp: 0.85
    sleep 2
    play :C3, amp: 0.85
    sleep 2
  end
  stop
end

sleep 16
sample :drum_cymbal_closed, rate: -1, beat_stretch: 4, pitch: :E2, amp: 0.9
sleep 4
sample rulerOfMyHeart, beat_stretch: 28
sleep 28
with_fx :echo do
  sample :drum_cymbal_closed, rate: -1, beat_stretch: 4, pitch: :E4, amp: 0.8
end
sleep 4

amp = 3
with_fx :tremolo do
  3.times do
    with_fx :pitch_shift, pitch: -12, amp: amp do
      use_synth :piano
      main_melody
      amp = amp - 1
    end
  end
end
