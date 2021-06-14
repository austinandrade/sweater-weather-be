require "rails_helper"

RSpec.describe 'BackgroundsFacade' do
  it 'exists' do
    backgrounds_facade = BackgroundsFacade.new
    expect(backgrounds_facade).to be_an_instance_of(BackgroundsFacade)
  end

  describe '#get_photo' do
    it 'creates and returns a single photo object', :vcr do
      location = "denver, co"
      photo  = BackgroundsFacade.get_photo(location)
      expect(photo).to be_an_instance_of(Photo)
    end
  end
end
