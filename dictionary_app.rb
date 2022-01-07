require "http"

puts "Please enter a word to find its definition"
word = gets.chomp 
puts " "
#puts word

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=f0c54bfe816e1c9cb917306c542021034d976d6be0d159c3c")

#this gets the body, removes header and other junk
output = response.parse(:json)

definition = output[0]["text"]


puts "The definition of #{word} is: #{definition}."
puts " "

response_two = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=f0c54bfe816e1c9cb917306c542021034d976d6be0d159c3c")

output_two = response_two.parse(:json)

example = output_two["examples"][0]["text"]
#puts example

puts "An example of a #{word} is: #{example}."
puts " "

response_three = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=f0c54bfe816e1c9cb917306c542021034d976d6be0d159c3c")

output_three = response_three.parse(:json)

pronunciation = output_three[0]["raw"]
puts "The pronunciation of #{word} is #{pronunciation}."