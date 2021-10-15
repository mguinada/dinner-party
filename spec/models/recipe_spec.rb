require 'rails_helper'

RSpec.describe Recipe, type: :model do
  specify { should validate_presence_of(:name) }
  specify { should validate_uniqueness_of(:name) }
end
