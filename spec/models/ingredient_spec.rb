require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  specify { should validate_presence_of(:description) }
  specify { should validate_uniqueness_of(:description) }
end
