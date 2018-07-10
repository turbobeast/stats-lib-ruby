module Stats
  # Statistics functions
  module Utils
    def pipe(*fns)
      recurse = ->(*vals) do fns.count != 0 ? recurse.call(fns.shift.call(*vals)) : vals[0] end
    end

    def sub(a, b)
      a - b
    end

    def popshift(*set)
      [set.first, set.last]
    end

    def swap(a, b)
      [b, a]
    end

    def squares(*set)
      square = ->(b) do b * b end
      set.map(&square)
    end

    def half(*set)
      (set.count.to_f * 0.5).floor
    end

    def two_chunks(half)
      lambda { |*set|
        [set.slice(0, half), set.slice(set.count.even ? half : half + 1)]
      }
    end

    # format like this
    # ->(ray) do ray.map { |inner| yield(*inner) } end
    # if called like this
    #  maper = Stats::Utils.map_two_d_array_with { |*a| a.map { |b| b * b} }

    # ->(ray) do ray.map { |inner| inner.map(&func) } end
    def map_two_d_array_with
      ->(ray) do ray.map { |inner| yield(*inner) } end
    end

    module_function(
      :pipe,
      :sub,
      :popshift,
      :swap,
      :squares,
      :half,
      :two_chunks,
      :map_two_d_array_with
    )
  end
end
