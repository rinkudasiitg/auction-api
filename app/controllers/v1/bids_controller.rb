module V1
  class BidsController < ApplicationController
    before_action :set_item
    before_action :set_item_bid, only: [:show, :update, :destroy]

    # GET /items/:item_id/bids
    def index
      json_response(@item.bids)
    end

    # GET /items/:item_id/bids
    def show
      json_response(@bid)
    end

    # POST /items/:item_id/bids
    def create
      @item.bids.create!(item_params)
      json_response(@item, :created)
    end

    # PUT /items/:item_id/bids/:id
    def update
      @bid.update(item_params)
      head :no_content
    end

    # DELETE /items/:item_id/bids/:id
    def destroy
      @bid.destroy
      head :no_content
    end
    
    
    private

    def bid_params
      params.permit(:bid_amount)
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def set_item_bid
      @bid = @item.bids.find_by!(id: params[:id]) if @item
    end
  end
end
