#stats controller
class StatsController < ApplicationController
	require 'gchart'
	def index
		totalspots = Parkingspot.count('id');
		available = Parkingspot.where(status: 'open').count('id');
		reserved = Parkingspot.where(status: 'reserved').count('id');
		taken = Parkingspot.where(status: 'taken').count('id');

		@piechart = Gchart.pie(data: [available, reserved, taken], 

			labels: ['Available: ' + available.to_s, 'Reserved: ' + reserved.to_s, 'Taken: ' + taken.to_s],
			title: 'Lot Statistics (out of ' + totalspots.to_s + ' spots)' , theme: :pastel,
			bg: 'd9cce0',
			font_color: '0000f',
			labels_color: 'd9cce0',
			graph_bg: 'd9cce0',
			title_color: '00000f');

	end
end
