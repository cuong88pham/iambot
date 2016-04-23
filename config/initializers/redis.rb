uri = URI.parse('redis://redistogo:1fff91f97ce17749fa70eccda20c62b9@barb.redistogo.com:9402/0')
$redis = Redis.new(:url => uri)