# Create a thesaurus program. To create it, you will create two classes, Thesaurus and Entry.
# A Thesaurus will contain many Entries. An Entry contains three primary attributes:
# word, synonymns, and antonyms. Your application should contain the following features:
# 1. The ability to add new words to a Thesaurus.
# 2. The ability to delete a word from a Thesaurus. 
# 3. The ability to look up a word's synonyms.
# 4. The ability to look up a word's antonyms.
# 5. The ability to add a synonym to a word.
# 6. The ability to add an antonym to a word.
#
# Part of the challenge is to determine which functionality belongs in the Thesaurus class,
# and which belongs in the Entry class.
#
# And... test your functionality using RSpec!
require 'rspec'

class Thesaurus
  attr_accessor :entries
  def initialize
    @entries = []
  end

  def find_word(word)
    result = ""
    @entries.each do |entry|
      if entry.word == word
        result = entry
        break
      else
        result = nil
      end
    end
    result
  end

  def add_word(word)
    @entries << Entry.new(word)
    puts "#{word["word"]} added!"
  end

  def delete_word(word)
    entry = find_word(word)
    if !entry.nil?
      puts "#{entry.word} deleted."
      @entries.delete(entry)
    else
      "That word is not in the thesaurus."
    end
  end

  def synonyms(word)
    entry = find_word(word)
    if !entry.nil?
      puts entry.synonym
    else
      puts "#{word} is not in the thesaurus."
    end
  end

  def antonyms(word)
    entry = find_word(word)
    if !entry.nil?
      puts entry.antonym
    else
      puts "#{word} is not in the thesaurus."
    end
  end

  def add_synonym(word, synonym)
    entry = find_word(word)
    if !entry.nil?
      entry.synonym << synonym
      entry.synonym
    else
      puts "#{word} is not in the thesaurus."
    end
  end

  def add_antonym(word, antonym)
    entry = find_word(word)
    if !entry.nil?
      entry.antonym << antonym
      entry.antonym
    else
      puts "#{word} is not in the thesaurus."
    end
  end
end

class Entry
  attr_accessor :word, :synonym, :antonym
  def initialize(hash)
    @word = hash["word"]
    @synonym = hash["synonym"]
    @antonym = hash["antonym"]
  end
end

test = Thesaurus.new
test.add_word({"word" => "good", "synonym" => ["excellent", "wonderful"], "antonym" => ["bad", "horrible"]})
test.add_word({"word" => "bad", "synonym" => ["horrible"], "antonym" => ["good"]})

# thesaurus.add_word({"word" => "good", "synonym" => ["excellent", "wonderful"], "antonym" => ["bad", "horrible"]})
# thesaurus.add_word({"word" => "bad", "synonym" => ["horrible"], "antonym" => ["good"]})
# p thesaurus.entries
# p "*****************"

# thesaurus.delete_word("bad")
# p "*********************"
# p thesaurus.entries
# p "***********************"
# thesaurus.synonyms("good")

# thesaurus.synonyms("fish")

# p '************************'

# thesaurus.antonyms("good")
# thesaurus.antonyms("fish")

# p "***********************"

# thesaurus.add_synonym("good", "fantastic")
# thesaurus.add_synonym("fish", "amphibious")
# thesaurus.synonyms("good")

# p "**********************"

# thesaurus.add_antonym("good", "miserable")
# thesaurus.add_antonym("fish", "land animal")
# thesaurus.antonyms("good")
