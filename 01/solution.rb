class Array

	def to_hash
		inject({}) do |result, element|
			raise "Array is not a list of pairs." if element.length != 2
			result[element.first] = element.last
			result
		end
	end

	def index_by
		hash = {}
		each { |element| hash[yield(element)] = element }
		hash
	end

	def subarray_count(subarray)
		each_cons(subarray.length).count(subarray)
	end

	def occurences_count
		Hash.new(0).tap do |result|
			each { |item| result[item] += 1 }
		end
	end

end