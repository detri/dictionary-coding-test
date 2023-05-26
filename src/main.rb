require './src/unique_sequence_parser.rb'

sequence_parser = UniqueSequenceParser.new("dictionary_words")
sequence_parser.parse.save_to_disk
