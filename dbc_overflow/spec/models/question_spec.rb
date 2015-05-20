require 'rails_helper'

RSpec.describe Question, type: :model do
  
  context "valid" do
    it 'should save a valid question' do
      expect{ Question.create!(title: 'thing', content: 'thing') }.to change{ Question.count }.by(1)
    end
  end

  context 'invalid' do
    it 'should not have empty title' do
      expect{ Question.create!(content: "hello") }.to raise_error
    end

    it 'should not have empty content' do 
      expect{ Question.create!(title: "hello") }.to raise_error 
    end
  end

end
