# -*- coding: utf-8 -*-

require "spec_helper"
require "pp"

describe Ugigi, "が #search を呼ぶ時は" do
  before do
    @free_search_result = Ugigi.search(:free => "霊夢")
  end
  
  it "Array を返すこと" do
    @free_search_result.class.should == Array
  end

  it "配列の中身が全て Ugigi::Index であること" do
    @free_search_result.each do |i|
      i.class.should == Ugigi::Index
    end
  end
end

describe Ugigi, "が #total_count を呼ぶ時は" do
  before do
    @total_count_result = Ugigi.total_count(:free => "霊夢")
  end
  
  it "Fixnum を返すこと" do
    @total_count_result.class.should == Fixnum
  end
end