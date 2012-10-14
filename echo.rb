Dir["./lib/*.rb"].each { |f| require f }

require "rubygems"
require "bundler"
Bundler.require :default

tweetfile = '/Users/echo/Dropbox/twitter/twitter.txt'

rawtweets = File.open(tweetfile, 'r') or die "Can't find data!"

tweetlist = []
rawtweets.each do |line|
	next if (line.strip == "")
	next if (line =~ /^@/)
	tweetlist << line.strip
end

mc = MarkovChain.new(tweetlist)
5.times do
	max_words = 20 + rand(10)
	puts mc.get_unique_line(max_words)
end
