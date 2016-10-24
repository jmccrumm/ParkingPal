# You can now do all these things with a single command

namespace :db do
	task :doitall => :environment do
		require 'rake'
		Rake::Task['db:drop'].invoke
		Rake::Task['db:create'].invoke
		Rake::Task['db:migrate'].invoke
		Rake::Task['db:seed'].invoke
		Rake::Task['db:test:load'].invoke
	end
end