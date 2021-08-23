class SearchController < ApplicationController

  def search
    # 記入したvalue(検索ワード)の値を@valueに代入
    @content = params["search"]["value"]
    @records = Item.search_for(@content)
  end

end
