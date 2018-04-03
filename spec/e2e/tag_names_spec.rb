# TODO: Inspiration from https://github.com/pat/gutentag gem.
# Not working :)

require_relative '../spec_helper'

describe "Managing tags via names" do
  let(:breed) { Breed.create }

  it "returns tag names" do
    breed.tags << Taggiefy::Tag.create(:name => 'random')
    expect(breed.tag_names.to_a).to include('random')
  end

  it "adds tags via their names" do
    breed.tag_names << 'random'
    expect(breed.tags.collect(&:name)).to eq(['random'])
  end

  it "accepts a completely new set of tags" do
    breed.tag_names = %w(weird gems)
    expect(breed.tags.collect(&:name)).to  eq(%w(weird gems))
  end

  it "enumerates through tag names" do
    breed.tag_names = %w(random clear)
    names = []
    breed.tag_names.each do |name|
      names << name
    end
    expect(names).to eq(%w(random clear))
  end

  it "does not allow duplication of tags" do
    existing = Breed.create
    existing.tags << Taggiefy::Tag.create(:name => 'weird')
    breed.tag_names = ['weird']
    expect(existing.tag_ids).to eq(breed.tag_ids)
  end

  it "appends tag names" do
    breed.tag_names  = ['weird']
    breed.tag_names += ['gems', 'ruby']
    expect(breed.tags.collect(&:name)).to eq (%w(weird gems ruby))
  end

  it "removes a single tag name" do
    breed.tag_names = %w(weird gems)
    breed.tag_names.delete 'gems'

    expect(breed.tags.collect(&:name)).to eq(['weird'])
  end

  it "removes tag names" do
    breed.tag_names  = %w(weird gems ruby)
    breed.tag_names -= %w(gems ruby)
    expect(breed.tags.collect(&:name)).to eq(['weird'])
  end
end