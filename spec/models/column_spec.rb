require 'rails_helper'

RSpec.describe Column, type: :model do
  let(:column) { FactoryBot.build(:column) }

  it { should belong_to(:board).without_validating_presence }

  it "is valid with valid attributes" do
    expect(column).to be_valid
  end

  it "is not valid without a title" do
    column.title = nil
    expect(column).not_to be_valid
  end

  it "is not valid without an order" do
    column.order = nil
    expect(column).not_to be_valid
  end
end
