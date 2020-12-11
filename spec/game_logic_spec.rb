require_relative '../lib/game_logic'
require_relative '../lib/player'

describe GameLogic do
  let(:play) { GameLogic.new }
  describe 'GameLogic' do
    it 'returns true if move was accepted' do
      play.board = ['X ', 'X ', 'O ', 'O ', 'O ', 'O ', ' ', ' ', ' ']
      expect(play.valid_move?(8)).to eql(true)
    end
    it 'returns false if position > 8' do
      expect(play.valid_move?(10)).to eql(false)
    end
    it 'returns false if position is taken' do
      play.board = ['X ', 'X ', 'O ', 'O ', 'O ', 'O ', ' ', ' ', ' ']
      expect(play.position_taken?(2)).to eql(false)
    end
    it 'returns an integer minus 1 when a string is inputted' do
      expect(play.input_to_index('3')).to eql(2)
    end
  end
end