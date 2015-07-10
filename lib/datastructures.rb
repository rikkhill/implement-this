# Common data structures, written from scratch

# Originally implemented with the String.hash method, but this
# resulted in weird hash collision behaviour, and ultimately
# made the hash unreliable

require 'digest/sha1'

module DataStructures
  # Homebrew hashmap
  class MyHash
    attr_reader :length, :size
    def initialize(init, size=32)
      @size = init.length > size ? init.length + size : size
      @length = init.length
      @val_arr = Array.new(@size, nil)
      @key_arr = Array.new(@size, nil)
      init.each do |n|
        self.insert(n[0], n[1])
      end
    end

    def insert(key, val)
      if @length == @size
        upscale
      end
      hash = Digest::SHA1.hexdigest(key.to_s).to_i % @size
      @val_arr[hash] = val
      @key_arr[hash] = key.to_s
      @length += 1
    end

    def delete(key)
      hash = Digest::SHA1.hexdigest(key.to_s).to_i % @size
      @val_arr[hash] = nil
      @key_arr[hash] = nil
    end

    def fetch(key)
      hash = Digest::SHA1.hexdigest(key.to_s).to_i % @size
      return @val_arr[hash]
    end

    def keys
      return @key_arr.compact
    end

    def vals
      return @val_arr.compact
    end

    private
    # Add an additional 24 slots to the hash and pour in existing values
    def upscale
      old_val_arr = @val_arr.compact
      old_key_arr = @key_arr.compact
      initialize(old_key_arr.zip(old_val_arr), @size + 32)
    end
  end

  def superhash(init=[])
    return MyHash.new(init)
  end
end
