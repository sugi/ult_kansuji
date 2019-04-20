require "spec_helper"
RSpec.describe YaKansuji::Formatter::Gov do
  def k(num, opt = {})
    subject.call num, opt
  end

  it "can convert number to kansuji" do
    expect(k 0).to eq "0"
    expect(k 1).to eq "1"
    expect(k(1234)).to eq "1234"
    expect(k(10003)).to eq "1万, 3"
    expect(k(10_010_003)).to eq "1001万, 3"
    expect(k(100_000_003)).to eq "1億, 3"
    expect(k(200_000_000_056)).to eq "2000億, 56"
    expect(k(9_030_000_001_008)).to eq "9兆, 300億, 1008"
    expect(k 1000100010000).to eq "1兆, 1億, 1万"

    expect(k 9999999).to eq "999万, 9999"
    expect(k 900000000000000000000000000000000000000000000000000000000000000000).to eq "90不可思議"
    expect(k 100000000000000000000000000000000000000000000000000000000000000000000).to eq "1無量大数"
    expect(k 111111111111111111111111111111111111111111111111111111111111111111111111).to eq "1111無量大数, 1111不可思議, 1111那由他, 1111阿僧祇, 1111恒河沙, 1111極, 1111載, 1111正, 1111澗, 1111溝, 1111穣, 1111𥝱, 1111垓, 1111京, 1111兆, 1111億, 1111万, 1111"
    expect(k 999999999999999999999999999999999999999999999999999999999999999999999999).to eq "9999無量大数, 9999不可思議, 9999那由他, 9999阿僧祇, 9999恒河沙, 9999極, 9999載, 9999正, 9999澗, 9999溝, 9999穣, 9999𥝱, 9999垓, 9999京, 9999兆, 9999億, 9999万, 9999"
  end
end
