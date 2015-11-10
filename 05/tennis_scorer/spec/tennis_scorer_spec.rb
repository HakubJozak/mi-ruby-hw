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


end
