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
    "#{word['word']} added!"
  end

  def delete_word(word)
    entry = find_word(word)
    if !entry.nil?
      @entries.delete(entry)
      "#{entry.word} deleted."
    else
      "That word is not in the thesaurus."
    end
  end

  def synonyms(word)
    entry = find_word(word)
    if !entry.nil?
      entry.synonym
    else
      "#{word} is not in the thesaurus."
    end
  end

  def antonyms(word)
    entry = find_word(word)
    if !entry.nil?
      entry.antonym
    else
      "#{word} is not in the thesaurus."
    end
  end

  def add_synonym(word, synonym)
    entry = find_word(word)
    if !entry.nil?
      entry.synonym << synonym
      entry.synonym
    else
      "#{word} is not in the thesaurus."
    end
  end

  def add_antonym(word, antonym)
    entry = find_word(word)
    if !entry.nil?
      entry.antonym << antonym
      entry.antonym
    else
      "#{word} is not in the thesaurus."
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

RSpec.describe Thesaurus do
  let(:thesaurus) { Thesaurus.new }

  describe 'add_word' do
    it "should add a word to the thesaurus and return the name of the word added." do
      expect(thesaurus.add_word({"word" => "good", "synonym" => ["excellent", "wonderful"], "antonym" => ["bad", "horrible"]})).to eq("good added!")
    end
  end

  describe 'add_word' do
    it "should add a word to the thesaurus and return the name of the word added." do
      expect(thesaurus.add_word({"word" => "bad", "synonym" => ["horrible"], "antonym" => ["good"]})).to eq("bad added!")
    end
  end

  describe 'delete_word' do
    it "should delete a word from the thesaurus and return the name of the deleted word." do
      expect(thesaurus.delete_word("bad")).to eq("bad deleted.")
    end
  end

  describe 'synonyms' do
    it "should return all the synonyms of that word." do
      expect(thesaurus.synonyms("good")).to eq(['excellent', 'wonderful'])
    end
  end

  describe 'synonyms' do
    it "should return word is not in the thesaurus if given a word not in the thesaurus." do
      expect(thesaurus.synonyms("fish")).to eq("fish is not in the thesaurus.")
    end
  end

  describe 'antonyms' do
    it "should return all of the antonyms for a word." do
      expect(thesaurus.antonyms("good")).to eq(['bad', 'horrible'])
    end
  end

  describe 'antonyms' do
    it "should return word is not in the thesaurus if given a word not in the thesaurus." do
      expect(thesaurus.antonyms("fish")).to eq("fish is not in the thesaurus.")
    end
  end

  describe 'add_synonym' do
    it "should add a synonym to the entry for a specific word and return all the synonyms. ," do
      expect(thesaurus.add_synonym("good", "fantastic")).to eq(['excellent', 'wonderful', 'fantastic'])
    end
  end

  describe 'add_synonym' do
    it "should return word is not in the thesaurus if the word is not in the thesaurus." do
      expect(thesaurus.add_synonym("fish", "amphibious")).to eq("fish is not in the thesaurus.")
    end
  end

  describe 'add_antonym' do
    it "should add a antonym to the entry for a specific word and return all the antonyms. ," do
      expect(thesaurus.add_antonym("good", "miserable")).to eq(['bad', 'horrible', 'miserable'])
    end
  end

  describe 'add_antonym' do
    it "should return word is not in the thesaurus if the word is not in the thesaurus." do
      expect(thesaurus.add_antonym("fish", "land animal")).to eq("fish is not in the thesaurus.")
    end
  end
end