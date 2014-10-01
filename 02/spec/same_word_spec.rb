#!/usr/bin/env ruby
require 'rspec'
require_relative 'spec_helper'
require_relative '../02_same_word'

describe 'Same word' do

  context 'finds duplicate words in a given file' do
    subject(:res) { same_word("#{File.dirname(__FILE__)}/words/01.txt") }
    it { is_expected.to be_an_instance_of Hash }
    it { expect(res.size).to be 2 }
    it { expect(res.key?(1)).to be true }
    it { expect(res.key?(2)).to be true }
    it { expect(res.key?(3)).to be false }
    it { expect(res.value?(['simple'])).to be true }
    it { expect(res.value?(%w(test done))).to be true }
  end

  context 'find duplicates in the second file' do
    subject(:res) { same_word("#{File.dirname(__FILE__)}/words/02.txt") }
    it { is_expected.to be_an_instance_of Hash }
    it { expect(res.key?(2)).to be true }
    it { expect(res.key?(3)).to be true }
    it { expect(res.key?(6)).to be true }
    it { expect(res[2]).to eq ['the'] }
  end

  context 'ignores interpunction' do
    subject(:res) { same_word("#{File.dirname(__FILE__)}/words/02.txt") }
    it { is_expected.to be_an_instance_of Hash }
    it { expect(res.value?(['the'])).to be true }
  end

  context 'ingores case' do
    subject(:res) { same_word("#{File.dirname(__FILE__)}/words/02.txt") }
    it { is_expected.to be_an_instance_of Hash }
    it { expect(res.value?(['this'])).to be true }
  end
end
