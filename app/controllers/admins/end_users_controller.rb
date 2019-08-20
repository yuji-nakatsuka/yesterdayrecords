class Admins::EndUsersController < ApplicationController
	def index
		@end_users = EndUser.all
	end

	def show
	end

	def edit
	end

	def destroy
	end

	def update
	end
end
	# index
	# 	＠フロント型
	# 	バックエンド
	# show
	# 	＠フロント型
	# 	バックエンド
	# destroy
	# 	アクション
	# edit
	# 	フロント型　つか
	# 	バックエンド
	# update
	# 	アクション