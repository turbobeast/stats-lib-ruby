require 'stats/lib/version'
require 'stats/utils'
# Statistics functions
module Stats
  # Statistics functions
  module Lib
    # Your code goes here...
    def dists(standard_mean)
      ->(*set) do set.map { |a| a - standard_mean } end
    end

    def mean(*set)
      bbb = set.reduce { |a, b| a + b }
      bbb / set.count
    end

    def dists_from_mean(*set)
      Stats::Utils.pipe(dists(Stats::Lib.mean(*set))).call(*set)
    end

    def variance(*set)
      Stats::Utils.pipe(
        ->(s) { Stats::Lib.dists_from_mean(*s) },
        ->(s) { Stats::Utils.squares(*s) },
        ->(s) { Stats::Lib.mean(*s) }
      ).call(*set)
    end

    module_function :mean, :dists_from_mean, :dists, :variance
  end
end
