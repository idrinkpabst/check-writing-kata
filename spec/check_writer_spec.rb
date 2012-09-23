require 'spec_helper'

describe "CheckWriter" do

  subject { lambda { |num| CheckWriter.amount_to_words(num)} }

  describe "should convert numbers 1 <= num < 10" do
    it { subject.call(1).should == "one" }
    it { subject.call(2).should == "two" }
    it { subject.call(3).should == "three" }
    it { subject.call(8).should == "eight" }
  end

  describe "should convert numbers 10 <= num < 20" do
    it { subject.call(10).should == "ten" }
    it { subject.call(11).should == "eleven" }
    it { subject.call(16).should == "sixteen" }
    it { subject.call(19).should == "nineteen" }
  end

  describe "should convert numbers 20 <= num < 30" do
    it { subject.call(20).should == "twenty" }
    it { subject.call(21).should == "twenty one" }
    it { subject.call(22).should == "twenty two" }
    it { subject.call(28).should == "twenty eight" }
  end

  describe "should convert numbers 30 <= num < 100" do
    it { subject.call(30).should == "thirty" }
    it { subject.call(40).should == "fourty" }
    it { subject.call(45).should == "fourty five" }
    it { subject.call(83).should == "eighty three" }
    it { subject.call(99).should == "ninety nine" }
  end

  describe "should convert numbers 100 <= num < 1_000" do
    it { subject.call(100).should == "one hundred" }
    it { subject.call(101).should == "one hundred one" }
    it { subject.call(208).should == "two hundred eight" }
    it { subject.call(476).should == "four hundred seventy six" }
    it { subject.call(821).should == "eight hundred twenty one" }
    it { subject.call(999).should == "nine hundred ninety nine" }
  end

  describe "should convert numbers 1_000 <= num < 10_000" do
    it { subject.call(1000).should == "one thousand" }
    it { subject.call(1001).should == "one thousand one" }
    it { subject.call(2563).should == "two thousand five hundred sixty three" }
    it { subject.call(7430).should == "seven thousand four hundred thirty" }
    it { subject.call(8431).should == "eight thousand four hundred thirty one" }
    it { subject.call(9999).should == "nine thousand nine hundred ninety nine" }
  end

  describe "should convert numbers 10_000 <= num < 100_000" do
    it { subject.call(10_000).should == "ten thousand" }
    it { subject.call(10_001).should == "ten thousand one" }
    it { subject.call(24_365).should == "twenty four thousand three hundred sixty five" }
    it { subject.call(73_000).should == "seventy three thousand" }
    it { subject.call(82_586).should == "eighty two thousand five hundred eighty six" }
    it { subject.call(99_999).should == "ninety nine thousand nine hundred ninety nine" }
  end


  describe "should convert numbers 100_000 <= num < 1_000_000" do
    it { subject.call(100_000).should == "one hundred thousand" }
    it { subject.call(100_001).should == "one hundred thousand one" }
    it { subject.call(438_695).should == "four hundred thirty eight thousand six hundred ninety five" }
    it { subject.call(643_012).should == "six hundred fourty three thousand twelve" }
    it { subject.call(843_210).should == "eight hundred fourty three thousand two hundred ten" }
    it { subject.call(999_999).should == "nine hundred ninety nine thousand nine hundred ninety nine" }
  end

  describe "should convert numbers 1_000_000 <= num < 1_000_000_000" do
    it { subject.call(1_000_000).should == "one million" }
    it { subject.call(1_000_001).should == "one million one" }
    it { subject.call(35_438_695).should == "thirty five million four hundred thirty eight thousand six hundred ninety five" }
    it { subject.call(629_643_012).should == "six hundred twenty nine million six hundred fourty three thousand twelve" }
    it { subject.call(999_999_999).should == "nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine" }
  end

  describe "should convert numbers 1 billion <= num < 1 trillion" do
    it { subject.call(1_000_000_000).should == "one billion" }
    it { subject.call(1_000_000_001).should == "one billion one" }
    it { subject.call(64_335_438_695).should == "sixty four billion three hundred thirty five million four hundred thirty eight thousand six hundred ninety five" }
    it { subject.call(231_629_643_012).should == "two hundred thirty one billion six hundred twenty nine million six hundred fourty three thousand twelve" }
    it { subject.call(999_999_999_999).should == "nine hundred ninety nine billion nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine" }
  end

  describe "should convert floats" do
    it { subject.call(12.43).should == "twelve and 43/100" }
    it { subject.call(99.99).should == "ninety nine and 99/100" }
    it { subject.call(32.00).should == "thirty two" }
  end


end
