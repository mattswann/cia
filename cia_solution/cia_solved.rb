# CIA World Factbook
require 'json'

file = File.read('big.json')
data = JSON.parse(file)

# Write a method to list the capitals of the world in alphabetical order.
def capitals(data)
  allcaps = []
  data.each do |country|
    name = country['govt']['capital']['name']
    if (name) # Some capitals are nil. Why is that? Anyway, we test for it here.
      allcaps.push(name)
    end
  end
  puts 'Capitals of the world, sorted:'
  puts allcaps.sort!
  puts
end


# Write a method to list the countries whose names end in '-stan'.
def the_stans(data)
  stans = []
  data.each do |country|
    name = country['govt']['country_name']['conventional_short_form']
    if name[-4..-1] == "stan"
      stans.push(name)
    end   
  end
  puts 'The Stans:'
  puts stans
  puts
end

# Write a method to list the top ten countries by arable land.
def farmies(data)
  arable = []
  data.each do |country|
    arable_hash = Hash.new
    name_section = country['govt']['country_name']

    # Here we can use the ternary operator to validate the data. If the country has no short form name (i.e., 'none'), use the long form. See the README for more on the ternary operator.
    arable_hash['name'] = name_section['conventional_short_form'] == 'none' ? name_section['conventional_long_form'] : name_section['conventional_short_form']

    # Here we can use the ternary operator to validate the data. If the country's land use hash is absent, set arable land to 0%. See the README for more on the ternary operator.
    arable_hash['percentage'] = country['geo']['land_use'] ? country['geo']['land_use']['arable_land'].to_f : 0
    arable.push(arable_hash)
  end
  arable.sort_by! { |land_hash| -1 * land_hash['percentage'] }
  puts 'Most arable land:'
  arable.first(10).each do |hash|
    puts "#{hash['name']}: #{hash['percentage']}%"
  end
  puts
end

# Write a method to get a question from the user and answer it.
def expert(data)

  # Set it up
  puts 'How big is Tunisia? => Tunisia is: slightly larger than Georgia.'
  puts 'What\'s the capital of Iran? => The capital of Iran is Tehran.'
  puts
  puts 'Can I help you? '
  question = gets.chomp
  size = ''
  capital = ''
  accepted_name = ''
  failure = 'I\'m afraid I can\'t answer that.'

  # How big is it?
  if question.include? "big"
    last_word = question.split(' ').last.gsub(/\?/,'')

    data.each do |country|
      name_section = country['govt']['country_name']
      requested_name = name_section['conventional_short_form'] == 'none' ? name_section['conventional_long_form'] : name_section['conventional_short_form']
      if last_word == requested_name
        size = country['geo']['area_comparative']['text']
        accepted_name = requested_name
      end
    end

    answer = (size == '') ? failure : "#{accepted_name} is: #{size}."

  # What's the capital?
  elsif question.include? "capital"
    last_word = question.split(' ').last.gsub(/\?/, '')

    data.each do |country|
      name_section = country['govt']['country_name']
      requested_name = name_section['conventional_short_form'] == 'none' ? name_section['conventional_long_form'] : name_section['conventional_short_form']
      if last_word == requested_name
        capital = country['govt']['capital']['name']
        accepted_name = requested_name
      end      
    end

    answer = (capital == '') ? failure : "The capital of #{accepted_name} is: #{capital}."

  # Unanswerable question  
  else
    answer = failure
  end
  puts answer
  puts
end

# Call all the methods
capitals(data)

the_stans(data)

farmies(data)

expert(data)
