#!/usr/bin/env ruby
require_relative '../lib/money'
require_relative 'spec_helper'

describe Money do
  subject(:struct) { described_class.new }

  it 'converts numbers to money' do
    expect(5.to_money).to be_instance_of Money
  end

  it 'convert strings to money' do
    expect('5 CZK'.to_money).to be_instance_of Money
  end

  it 'converts with precision' do
    money = Money.new(200, :USD)
    expect(money.to_czk.to_usd).to eq money
  end

  it 'should be summable with numbers' do
    money = Money.new(200, :CZK)
    expect('150.0 CZK'.to_money + 50).to eq money
    expect('150,0 CZK'.to_money + 50).to eq money
    expect('150 CZK'.to_money + 50).to eq money
  end

  it 'should be able to convert to other currencies' do
    money = Money.new(200, :CZK)
    expect(money.respond_to?(:to_usd)).to eq true
    expect(money.respond_to?(:to_gbp)).to eq true
    expect(money.respond_to?(:to_chf)).to eq true
    expect(money.respond_to?(:to_pln)).to eq true
    expect(money.respond_to?(:to_nok)).to eq true
    expect(money.respond_to?(:to_ltl)).to eq true
    expect(money.respond_to?(:to_lvl)).to eq false
  end
end
