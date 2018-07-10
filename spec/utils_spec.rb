require 'stats/utils'

RSpec.describe Stats::Utils do
  context "pipe" do
    it "returns a function" do
      cheep = Stats::Utils.pipe(->(a) { a * 2 }, ->(a) { a * 4 }).call(10)
      expect(cheep).to eq 80
    end
  end

  context "sub" do
    it "subtracts vals" do
      expect(Stats::Utils.sub(12, 10)).to eq 2
    end
  end

  context "popshift" do
    it "returns new array with just first and last vals" do
      expect(Stats::Utils.popshift(10, 5, 4, 9, 12)).to eq [10, 12]
    end
  end

  context "squares" do
    it "returns array of squared vals" do
      expect(Stats::Utils.squares(4, 5, 6)).to eq [16, 25, 36]
    end
  end

  context "half" do
    it "return halfway point on array" do
      expect(Stats::Utils.half(1, 2, 3, 4)).to eq 2
      expect(Stats::Utils.half(1, 2, 3, 4, 5)).to eq 2
      expect(Stats::Utils.half(1, 2, 3, 4, 5, 6)).to eq 3
    end
  end

  context "map_two_d_array_with" do
    it "maps two inner arrays" do
      two_d = [[1, 2, 3], [4, 5, 6]]
      maper = Stats::Utils.map_two_d_array_with { |*a| a.map { |b| b * b } }
      mapd = maper.call(two_d)
      expect(mapd).to eq [[1, 4, 9], [16, 25, 36]]
    end
  end
end