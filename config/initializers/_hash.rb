class Hash
  def recursive_symbolize_keys!
    symbolize_keys!
    # symbolize each hash in .values
    values.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    # symbolize each hash inside an array in .values
    values.select{|v| v.is_a?(Array) }.flatten.each{|h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    self
  end

  # Returns a new hash containing only the keys specified
  # that exist in the current hash.
  #
  #  {:a => '1', :b => '2', :c => '3'}.only(:a, :c)
  #  # => {:a => '1', :c => '3'}
  #
  # Keys that do not exist in the original hash are ignored.
  # def only(*keys)
  #   inject( {} ) do |new_hash, (key, value)|
  #     new_hash[key] = value if keys.include?(key)
  #     new_hash
  #   end
  # end
end
