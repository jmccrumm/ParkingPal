class StatsController < ApplicationController
	def index
		require 'gchart'
		@totalspots = Parkingspot.count('id');
		@available = Parkingspot.where(status: 'open').count('id');
		@reserved = Parkingspot.where(status: 'reserved').count('id');
		@taken = Parkingspot.where(status: 'taken').count('id');

		@piechart = Gchart.pie(data: [@available, @reserved, @taken], 
			labels: ['Available: ' + @available.to_s, 'Reserved: ' + @reserved.to_s, 'Taken: ' + @taken.to_s],
			title: 'Lot Statistics (out of ' + @totalspots.to_s + ' spots)', theme: :pastel,
			bg: '0000FF00');
	end
end
