require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "requires the presence of a name" do
      expect(Tag.new).not_to be_valid
  end
end
