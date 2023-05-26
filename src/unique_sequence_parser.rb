class UniqueSequenceParser
  attr_reader :sequences

  def initialize(filename, sequence_length = 4)
    @filename = filename
    @sequence_length = sequence_length
    @sequences = {}
    @duplicates = {}
  end

  def parse
    File.foreach(@filename) do |word|
      check_word_sequences(word.strip)
    end
    puts "[Unique Sequence Parser] Finished parsing unique sequences."
    @duplicates.clear
    self
  end

  def save_to_disk
    File.delete("sequences") if File.file?("sequences")
    File.delete("words") if File.file?("words")
    File.open("sequences", "w") do |seq_file|
      File.open("words", "w") do |words_file|
        @sequences.each do |seq, word|
          seq_file.write("#{seq}\n")
          words_file.write("#{word}\n")
        end
      end
      puts "[Unique Sequence Parser] Wrote words file."
    end
    puts "[Unique Sequence Parser] Wrote sequences file."
  end

  def check_word_sequences(word, start = 0)
    char_range = start..(start + @sequence_length - 1)
    sequence = word[char_range].downcase

    return if sequence.length < @sequence_length

    if @duplicates.include?(sequence) || sequence.match?(/[^a-z]/)
      check_word_sequences(word, start + 1)
      return
    end

    if @sequences.include?(sequence)
      @duplicates[sequence] = @sequences.delete(sequence)
    else
      @sequences[sequence] = word
    end

    check_word_sequences(word, start + 1)
  end
end
