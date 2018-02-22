require 'awesome_print'
require 'pry'
require_relative 'scoring'

module Scrabble
  class Player < Scoring

    attr_reader :name, :played_words
    attr_writer :total_score

    def initialize(name)
      @name = name
      @played_words = []
      @total_score = 0
    end

    def play(word)
      if @total_score >= 100
        return false
      else
        @played_words << word
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      scores = @played_words.map { |i| Scrabble::Scoring.score(i) }
      total_score = scores.reduce(:+)
      return total_score
    end

    def won?
      if @total_score >= 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@played_words)
    end

    def highest_word_score
      scores = @played_words.map { |i| Scrabble::Scoring.score(i) }
      return scores.max
    end

  end

end
