# -*- encoding : utf-8 -*-
require_relative 'spec_helper'
require_relative '../tennis_scorer'

describe TennisScorer do

  subject(:scorer) { TennisScorer.new }

  describe '#score'

    it 'begins with' do
      expect(scorer.score).to eq '0-0'
    end

    context 'server wins a point' do
      before { scorer.server! }
      it { expect(scorer.score).to eq '15-0' }
    end

    context 'receiver wins a point' do
      before { scorer.receiver! }
      it { expect(scorer.score).to eq '0-15' }
    end
    

    context 'both win a point' do
      before {
        scorer.receiver!
        scorer.server!
      }
      it { expect(scorer.score).to eq '15-15' }
    end

    context 'game ball' do
      before {
        3.times { scorer.server! }
        2.times { scorer.receiver! }
      }
      it { expect(scorer.score).to eq '40-30' }
    end

    context 'break ball' do
      before {
        2.times { scorer.server! }
        3.times { scorer.receiver! }
      }
      it { expect(scorer.score).to eq '30-40' }
    end

    context 'deuce' do
      before { 4.times {
                 scorer.server!
                 scorer.receiver!
               }}
      it { expect(scorer.score).to eq 'Deuce' }
    end

    context 'deuce after battle' do
      before { 6.times {
                 scorer.server!
                 scorer.receiver!
               }}
      it { expect(scorer.score).to eq 'Deuce' }
    end

    context 'game won by server' do
      before { 4.times { scorer.server! } }
      it { expect(scorer.score).to eq '1-x' }
    end

    context 'game won by receiver' do
      before { 4.times { scorer.receiver! } }
      it { expect(scorer.score).to eq 'x-1' }
    end    


    context 'game won by server after battle' do
      before {
        10.times {
          scorer.server!
          scorer.receiver!
        }
        2.times { scorer.server! }
      }
      it { expect(scorer.score).to eq '1-x' }
    end


    context 'advantage server' do
      before {
        6.times { scorer.server! }
        5.times { scorer.receiver! }        
      }
      it { expect(scorer.score).to eq 'ADV-40' }
    end    

    

end
