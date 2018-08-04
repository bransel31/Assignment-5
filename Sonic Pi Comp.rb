define :play_amen do |n|
  sample :drum_heavy_kick
  sample :bass_dnb_f, sustain: 0, decay: 1 / n, pitch:[0,0,0,0,0.05].choose
  sample :loop_amen, attack: 0, release: 0.05, start: 1 - (1.0 / n), rate: [1,1,1,1,1,1,-1].choose
  with_fx(:bitcrusher, bits: 4, sample_rate: 8000) do
    with_fx(:echo,mix: 0.20,decay: 0.5) do
      with_synth :fm do
        play scale(:F3, :minor_pentatonic, num_octaves: 1).choose, amp: 0.25
      end
    end
  end
  sleep sample_duration(:loop_amen) / n
end





loop {play_amen([1,1,2,4,4,4,8,16,].choose)}

