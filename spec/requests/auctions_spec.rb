require 'rails_helper'

RSpec.describe 'Auctions API', type: :request do
  # add auctions owner
  let(:user) { create(:user) }
  # initialize test data 
  let!(:auctions) { create_list(:auction, 5, created_by: user.id) }
  let(:auction_id) { auctions.first.id }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /auctions
  describe 'GET /auctions' do
    # make HTTP get request before each example
    before { get '/auctions', params: {}, headers: headers }

    it 'returns auctions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /auctions/:id
  describe 'GET /auctions/:id' do
    before { get "/auctions/#{auction_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the auction' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(auction_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:auction_id) { 50 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Auction/)
      end
    end
  end

  # Test suite for POST /auctions
  describe 'POST /auctions' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: user.id, description: 'Test description', start_time: Time.now, end_time: Time.now + 15.days }.to_json }
    
    context 'when the request is valid' do
      before { post '/auctions', params: valid_attributes, headers: headers }

      it 'creates a auction' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: 'Foobar' }.to_json }

      before { post '/auctions', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Description can't be blank, Start time can't be blank, End time can't be blank/)
      end
    end
  end

  # Test suite for PUT /auctions/:id
  describe 'PUT /auctions/:id' do
    let(:valid_attributes) { { title: 'Test' }.to_json }

    context 'when the record exists' do
      before { put "/auctions/#{auction_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /auctions/:id
  describe 'DELETE /auctions/:id' do
    before { delete "/auctions/#{auction_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end