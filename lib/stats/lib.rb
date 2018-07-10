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
      set.reduce { |a, b| a + b } / set.count
    end

    def dists_from_mean(*set)
      Stats::Utils.pipe(dists(Stats::Lib.mean(*set))).call(*set)
    end

    module_function :mean, :dists_from_mean, :dists
  end
end
