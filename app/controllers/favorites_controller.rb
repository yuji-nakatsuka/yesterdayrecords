class FavoritesController < ApplicationController


	def create
		sell_cd = SellCd.find(params[:sell_cd_id])
		favorite = Favorite.new(sell_cd_id: sell_cd.id)
		favorite.end_user_id = current_end_user.id
		favorite.save
    	redirect_to  sell_cd_favorites_path
	end

	def destroy
	end

	def index
	end
end


       # <div class="fav">
       #        <%if @sell_cd.favorited_by?(current_user)%>
       #          <%= link_to sell_cd_favorites_path(@sell_cd), class: "fav-deatroy", method: :delete, remote: true do %>
       #            <i class="fa fa-heart" aria-hidden="true" style="color:red;"></i>
       #          <%end%>
       #        <%else%>
       #          <%= link_to sell_cd_favorites_path(@sell_cd), class: "fav-create", method: :post, remote: true do %>
       #            <i class="fa fa-heart" aria-hidden="true"></i>
       #          <%end%>
       #        <%end%>
       #        <%= link_to sell_cd_favorites_path(@sell_cd) do%><%= @sell_cd.favorites.count %> いいね<%end%>
       #      </div>