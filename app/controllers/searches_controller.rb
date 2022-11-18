class SearchesController < ApplicationController
    def show
        @keyword = params[:q].values[0]
        @q = Recipe.ransack(params[:q])
        @recipes = @q.result(distinct: true)
    end
end
