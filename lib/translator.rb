# require modules here
require 'yaml'



def load_library(file_path)
library = YAML.load_file(file_path)
# code goes here
# emoticons_hash = {}
# emoticons_hash[emojis]
# emoticons_hash

result = {"get_meaning"=> {}, "get_emoticon"=>{}}
library.each do |meaning, emoticons|
  result["get_meaning"][emoticons[1]] = meaning
  result["get_emoticon"][emoticons[0]] = emoticons[1]
end
   result
end



def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon) #accepts two arguments, the YAML file path and the emoticon
  library = load_library(file_path) #calls on load_library and gives it the argument of the file_path
  if library["get_emoticon"].include?(english_emoticon)
    library["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found" #returns an apology message if argument is not a known emoticon

  end
end



def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(japanese_emoticon)
    library["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  # code goes here
  end
end
