require 'rails_helper'

RSpec.describe Recipe, type: :model do
  specify { should validate_presence_of(:name) }
  specify { should have_and_belong_to_many(:ingredients) }

  let(:spaghetti) { create(:ingredient, description: "250 spaghetti") }
  let(:eggs) { create(:ingredient, description: "2 eggs") }
  let(:pecorino) { create(:ingredient, description: "3 tsp Pecorino Romano") }
  let(:olive_oil) { create(:ingredient, description: "1 tbsp extra-virgin olive oil") }
  let(:bacon) { create(:ingredient, description: "2 slices of bacon") }
  let(:pepper) { create(:ingredient, description: "1 tsp black pepper") }
  let(:salt) { create(:ingredient, description: "1 tsp of salt") }
  let(:garlic) { create(:ingredient, description: "3 cloves garlic") }

  let!(:spaghetti_alla_carbonara) do
    create(
      :recipe,
      name: "Spaghetti Alla Carbonara",
      ingredients: [
        spaghetti,
        eggs,
        pecorino,
        olive_oil,
        pepper,
        salt,
        garlic
      ]
    )
  end

  let!(:spaghetti_aglio_e_olio) do
    create(
      :recipe,
      name: "Spaghetti Aglio e Olio",
      ingredients: [
        spaghetti,
        olive_oil,
        pepper,
        salt,
        garlic
      ]
    )
  end

  let!(:bacon_and_eggs) do
    create(
      :recipe,
      name: "Bacon and Eggs",
      ingredients: [
        eggs,
        bacon,
        salt,
        pepper
      ]
    )
  end

  describe ".by_ingredients" do
    subject { described_class.by_ingredients(ingredients) }

    context "when ingredients is `nil`" do
      let(:ingredients) { nil }

      it { is_expected.to be_empty }
    end

    context "when ingredients is empty" do
      let(:ingredients) { [] }

      it { is_expected.to be_empty }
    end

    context "when the ingredients are a match a recipe" do
      let(:ingredients) { ['Spaghetti', 'Olive oil', 'Pepper', 'Salt', 'Garlic'] }

      it { is_expected.to contain_exactly(spaghetti_aglio_e_olio) }
    end

    context "when the ingredients are a full match to a recipe and their subset match another" do
      let(:ingredients) { ['Spaghetti', 'Eggs', 'Olive oil', 'Pepper', 'Salt', 'Garlic', 'Pecorino'] }

      it { is_expected.to contain_exactly(spaghetti_alla_carbonara, spaghetti_aglio_e_olio) }
    end
  end
end
