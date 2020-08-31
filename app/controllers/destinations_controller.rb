class DestinationsController < ApplicationController
    before_action :this_destination, only: [:show]

    def show 
    end



    private

    def destination_params
        params.require(:destination).permit(:name, :country)
    end

    def this_destination
        @destination = Destination.find(params[:id])
    end
end