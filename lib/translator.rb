require 'yaml'

def load_library(filepath)
  lib = {
      "get_meaning" => {},
      "get_emoticon" => {}
  }
  emoticon_file = YAML.load_file(filepath)

  emoticon_file.map do |key, value|
      lib["get_meaning"][value[1]] = key.to_s
      lib["get_emoticon"][value[0]] = value[1]
  end
  return lib
end

def get_japanese_emoticon(filepath, emoticon)
  file = load_library(filepath)

  if file["get_emoticon"].include?(emoticon)
      file["get_emoticon"].each do |key, value|
          if key == emoticon
              return value
          end
      end
  else file.include?(emoticon) == false
      return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filepath, emoticon)
  file = load_library(filepath)

  if file["get_meaning"].include?(emoticon)
      file["get_meaning"].each do |key, value|
          if key == emoticon
              return value
          end
      end
  else file.include?(emoticon) == false
      return "Sorry, that emoticon was not found"
  end
end
