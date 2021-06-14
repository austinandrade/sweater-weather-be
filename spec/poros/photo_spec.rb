require 'rails_helper'

RSpec.describe 'photo object' do
  before :each do
    location = 'denver, co'
    @photo = Photo.new(photo_info, location)
  end

  it 'exists' do
    expect(@photo).to be_an_instance_of(Photo)
  end

  it 'has attributes' do
    expect(@photo.id).to eq(nil)
    expect(@photo.image).to be_a(Hash)
  end
end
