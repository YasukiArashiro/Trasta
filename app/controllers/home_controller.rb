class HomeController < ApplicationController

	def top
		@requests = Request.where(request_status: 0).limit(10).order('created_at DESC')
	end

	def about
	end

	def thanks
	end

	def inquiry
	end

end
