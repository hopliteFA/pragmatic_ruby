def conversation
    puts "hello"
    yield
    puts "goodbye"
end

conversation { puts "good to meet you"}

def five_times
    1.upto(5) {|n| yield n}
end

five_times do |n|
    puts "#{n} situps"
    puts "#{n} pushups"
    puts "#{n} chinups"
end

def n_times(number)
    1.upto(number) do |count|
        yield count
    end
end

n_times(10) do |n|
    puts "#{n} situps"
    puts "#{n} pushups"
    puts "#{n} chinups"
end