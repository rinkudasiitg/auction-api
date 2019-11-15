require 'rails_helper'

RSpec.describe 'Items API' do
  let(:user) { create(:user) }
  # Initialize the test data
  let!(:auction) { create(:auction) }
  let!(:items) { create_list(:item, 5, auction_id: auction.id) }
  let(:auction_id) { auction.id }
  let(:id) { items.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /auctions/:auction_id/items
  describe 'GET /auctions/:auction_id/items' do
    before { get "/auctions/#{auction_id}/items", params: {}, headers: headers }

    context 'when auction exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all auction items' do
        expect(json.size).to eq(5)
      end
    end

    context 'when auction does not exist' do
      let(:auction_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Auction/)
      end
    end
  end

  # Test suite for GET /auctions/:auction_id/items/:id
  describe 'GET /auctions/:auction_id/items/:id' do
    before { get "/auctions/#{auction_id}/items/#{id}", params: {}, headers: headers }

    context 'when auction item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when auction item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for POST /auctions/:auction_id/items
  describe 'POST /auctions/:auction_id/items' do
    let(:valid_attributes) { { name: 'Kohinoor', description: "Test Item", base_price: 100, sold: false }.to_json }

    context 'when request attributes are valid' do
      before { post "/auctions/#{auction_id}/items", params: valid_attributes, headers: headers }
      
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/auctions/#{auction_id}/items", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /auctions/:auction_id/items/:id
  describe 'PUT /auctions/:auction_id/items/:id' do
    let(:valid_attributes) { { name: 'Cullinan' }.to_json }

    before { put "/auctions/#{auction_id}/items/#{id}", params: valid_attributes, headers: headers }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/Cullinan/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /auctions/:id' do
    before { delete "/auctions/#{auction_id}/items/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end