# Challenge F Glissando

note = 21
use_bpm 120
use_synth :piano

88.times do
  play note, sustain: 0.5
  note += 1
  sleep 0.5
end
88.times do
  play note, sustain: 0.5
  note -= 1
  sleep 0.5
end

88.times do
  play note, sustain: 0.25
  note += 1
  sleep 0.25
end
88.times do
  play note, sustain: 0.25
  note -= 1
  sleep 0.25
end

88.times do
  play note, sustain: 0.125
  note += 1
  sleep 0.125
end
88.times do
  play note, sustain: 0.125
  note -= 1
  sleep 0.125
end
