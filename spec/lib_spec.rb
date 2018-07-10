require 'stats/lib'

RSpec.describe Stats::Lib do
  context 'mean' do
    it 'calculates the mean' do
      expect(Stats::Lib.mean(4, 6)).to eq 5
    end
  end
  context 'dists_from_mean' do
    it 'returns array of dists from mean' do
      set = [12, 13, 15, 17, 19, 22]
      expect(Stats::Lib.mean(12, 13, 15, 17, 19, 22)).to eq 16
      expect(Stats::Lib.dists_from_mean(*set)).to eq [-4, -3, -1, 1, 3, 6]
    end
  end
  context 'variance' do
    it 'returns correct variance' do
      expect(Stats::Lib.variance(8, 9, 10, 11, 12)).to eq 2
      expect(Stats::Lib.variance(-10, 0, 10, 20, 30)).to eq 200
    end
  end
  context 'standard_deviation' do
    it 'returns standard deviation' do
      expect(Stats::Lib.standard_deviation(-10, 0, 10, 20, 30)).to eq Math.sqrt 200
      expect(Stats::Lib.standard_deviation(8, 9, 10, 11, 12)).to eq Math.sqrt 2
    end
  end
end
