class HomeController < ApplicationController
    def index
        render json: {result: true}
    end
end