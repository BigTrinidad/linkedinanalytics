module Test
	@config = "foo"

	class << self
		attr_accessor :config
	end

	def self.configure
		yield self.config
	end

	# def self.ptest1
	# 	@client_id = "this is a test"
	# 	p @client_id
	# end

	# def self.ptest2
	# 	yield ptest1
	# end

	# # Test.configure do |config|
	# # 	config.client_id = ENV['77xdly13q1h6wx'] 
	# # 	config.client_secret = ENV['FPFVihjDuz81F2so']
	# # end

end

# p Test.ptest2.client_id

# def my_method 
# 	p "reached the top"
# 	yield
# 	p "reached the bottom"
# end

# my_method do
# 	p "reached the block"
# end

Test.configure do |config|
	config = "foo bar"
	p configx
end