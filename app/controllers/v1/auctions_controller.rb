module V1
  class AuctionsController < ApplicationController
    before_action :set_auction, only: [:show, :update, :destroy]
  
    # GET /auctions
    def index
      @auctions = current_user.auctions.paginate(page: params[:page], per_page: 10)
      json_response(@auctions)
    end
  
    # POST /auctions
    def create
      @auction = current_user.auctions.create!(auction_params)
      json_response(@auction, :created)
    end
  
    # GET /auctions/:id
    def show
      json_response(@auction)
    end
  
    # PUT /auctions/:id
    def update
      @auction.update(auction_params)
      head :no_content
    end
  
    # DELETE /auctions/:id
    def destroy
      @auction.destroy
      head :no_content
    end
  
    private
  
    def auction_params
      # whitelist params
      params.permit(:title, :description, :start_time, :end_time)
    end
  
    def set_auction
      @auction = Auction.find(params[:id])
    end
  end
end