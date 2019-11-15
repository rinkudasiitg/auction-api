module V1  
  class ItemsController < ApplicationController
    before_action :set_auction
    before_action :set_auction_item, only: [:show, :update, :destroy]

    # GET /auctions/:auction_id/items
    def index
      json_response(@auction.items)
    end

    # GET /auctions/:auction_id/items/:id
    def show
      json_response(@item)
    end

    # POST /auctions/:auction_id/items
    def create
      @auction.items.create!(item_params)
      json_response(@auction, :created)
    end

    # PUT /auctions/:auction_id/items/:id
    def update
      @item.update(item_params)
      head :no_content
    end

    # DELETE /auctions/:auction_id/items/:id
    def destroy
      @item.destroy
      head :no_content
    end

    private

    def item_params
      params.permit(:name, :description, :base_price, :sold)
    end

    def set_auction
      @auction = Auction.find(params[:auction_id])
    end

    def set_auction_item
      @item = @auction.items.find_by!(id: params[:id]) if @auction
    end
  end
end
