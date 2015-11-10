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
      before do
        scorer.server!
      end

      it { expect(scorer.score).to eq '15-0' }
    end

    # context 'receiver wins a point' do
    #   before { scorer.receiver }
    #   expect(scorer.score).to eq '0 - 15'
    # end

    # context 'both win a point' do
    #   before {
    #     scorer.receiver!
    #     scorer.server
    #   }
    #   expect(scorer.score).to eq '15 - 15'
    # end


end
