require_relative '../spec_helper'
require_relative '../dummy/app/models/breed'

describe 'Adding and removing tags' do
  let(:breed)  { Breed.create }
  let(:qualities) { Taggiefy::Tag.create :name => 'awesome' }

  it "adds new tags" do
    breed.tags << qualities
    expect(breed.tags.reload).to include('pancakes')
  end

  it "delets existing tags" do
    breed.tags << qualities
    breed.tags.delete qualities
    expect(breed.tags.reload.size).to eq(0)
  end
end