require 'rails_helper'

RSpec.describe ArtworkAttachment, type: :model do
  it { should validate_presence_of(:picture) }
  it { should belong_to(:artwork) }
end
