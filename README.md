# Unique Sequence Dictionary Parser

#### NOTE: This was written and tested on a Windows machine using RubyMine and a Windows build of Ruby 3.1.2

Based on/fulfills requirements of: https://gist.github.com/seanbiganski/11180933

This repo parses unique sequences of characters from words across a dictionary file,
or a newline-delimited list of words. By default, it uses the file `src/dictionary_words`.

### To run:
- Clone this repo
- `cd` to the newly cloned directory
- Terminal: `ruby src/main.rb`
- Files `sequences` and `words` should be created in the repo directory upon completion

### To test:
- Terminal:
    ```
    bundle install
    bundle exec rspec -d
    ```
