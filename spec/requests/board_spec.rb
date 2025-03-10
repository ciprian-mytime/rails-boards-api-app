require 'rails_helper'

RSpec.describe Board, type: :request do
    let(:user) { FactoryBot.create(:user) }
    let(:boards) {[
      FactoryBot.build(:board, id: 1),
      FactoryBot.build(:board, id: 2),
      FactoryBot.build(:board, id: 3)
    ]}
    let(:board) { boards.first }

    before do
      sign_in user, scope: :user
      allow_any_instance_of(BoardsController).to receive(:authorize).and_return(true)
      allow_any_instance_of(BoardsController).to receive(:policy_scope).and_return(boards)
    end

    describe "GET /boards" do
      it "returns all boards" do
        allow(Board).to receive(:all).and_return(boards)

        get "/boards"
        expect(response).to render_template :index
      end
    end
end