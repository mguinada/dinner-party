require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  specify { should validate_presence_of(:description) }
  specify { should validate_uniqueness_of(:description) }
  specify { should have_and_belong_to_many(:recipes) }

  describe '.by_descriptions' do
    let!(:spaghetti) { create(:ingredient, description: "250 spaghetti") }
    let!(:eggs) { create(:ingredient, description: "2 eggs") }
    let!(:pecorino) { create(:ingredient, description: "3 tsp Pecorino Romano") }

    subject { described_class.by_descriptions(descriptions) }

    context "when descriptions is `nil`" do
      let(:descriptions) { nil }

      it { is_expected.to be_empty }
    end

    context "when descriptions is empty" do
      let(:descriptions) { [] }

      it { is_expected.to be_empty }
    end

    context "when descriptions are blank values" do
      let(:descriptions) { [" ", "  "] }

      it { is_expected.to be_empty }
    end

    context "when descriptions do not partially match any ingredient" do
      let(:descriptions) { ["Bacon", "Beef"] }

      it { is_expected.to be_empty }
    end

    context "when descriptions contain blank spaces and ingredient names" do
      let(:descriptions) { [" ", "Spaghetti", "  "] }

      it { is_expected.to contain_exactly(spaghetti) }
    end

    context "when descriptions match some ingredients" do
      let(:descriptions) { ["Spaghetti", "Pecorino", "Bacon"] }

      it { is_expected.to contain_exactly(spaghetti, pecorino) }
    end
  end
end
