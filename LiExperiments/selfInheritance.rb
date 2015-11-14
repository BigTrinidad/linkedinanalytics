module TestInheritance
	@testVariable = ""

	def self.configure
		yield @testVariable
	end
end

module TestInheritance2
	@testVariable = ""

	class << self
		attr_accessor :testVariable
	end

	class NotSelf
		@testVariable
	end

	def self.configure
		yield self.testVariable
	end
end

module Test2
	class << self
		p self
	end
end


TestInheritance2::NotSelf.instance_eval do
	@testVariable = TestInheritance2.testVariable
	def addToIt
		@testVariable + "foo"
	end
end

# TestInheritance.configure do |t|
# 	t = "foobar"
# 	p t
# end


# TestInheritance2.configure do |t|
# 	t = "foobar"
# 	p t
# end