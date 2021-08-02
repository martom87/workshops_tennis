class Monk
  actions={ meditate_on_life: "I know the meaning of life", meditate_on_the_universe: "I know the meaning of the universe",
    meditate_on_everything: "I know the meaning of everything" }

  actions.each do |action_name, _|
    define_method(action_name) do
      actions[action_name]
    end
  end
end

monk = Monk.new

puts monk.meditate_on_life
puts monk.meditate_on_the_universe
puts monk.meditate_on_everything
