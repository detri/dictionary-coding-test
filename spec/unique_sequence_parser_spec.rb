require_relative '../src/unique_sequence_parser.rb'

describe UniqueSequenceParser do
  context "when parsing a dictionary with a default sequence length of 4" do
    subject { UniqueSequenceParser.new("spec/test_dictionary.txt") }

    before do
      subject.parse
    end

    it "outputs all unique sequences" do
      unique_sequences = File.read("spec/test_sequences.txt")
      expect(subject.sequences.keys).to contain_exactly(*unique_sequences.split("\n"))
    end

    it "outputs all words correlated to unique sentences" do
      words = File.read("spec/test_words.txt")
      expect(subject.sequences.values).to contain_exactly(*words.split("\n"))
    end

    it "outputs sequences and related words in the same order" do
      sequences = subject.sequences.keys
      words = subject.sequences.values

      (0..subject.sequences.length - 1).each do |entry|
        expect(words[entry]).to include(sequences[entry])
      end
    end
  end
end
