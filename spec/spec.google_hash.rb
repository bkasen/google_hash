require 'sane'
require_rel '../ext/google_hash.so'
require 'spec/autorun'

describe "google_hash" do

  before do
   @subject = GoogleHashSparse.new
  end

  it "should be instantiable" do
    # nothing
  end

  it "should allow you to set a key" do
    @subject[33] = 'abc'
  end

  it "should allow you to retrieve a key" do
    @subject[33] = 'abc'
    @subject[33].should == 'abc'
  end

  it "should allow you to iterate" do
   @subject[33] = 'abc'
   @subject[44] = 'def'
   all_got = []
   @subject.each{|k, v|
    all_got << v
   }
   assert all_got.sort == ['abc', 'def']
  end

  it "should have all the methods desired" do
    pending "need"
    # guess these could all be tests, themselves...
    @subject.each_key {}
    @subject.each_value{}
    @subject.each{}
    @subject[33] = 'abc'
    @subject.length.should == 1
    @subject.delete(33).should == 'abc'
    @subject.clear
    @subject.length.should == 0
  end

  it "should not leak" do
    pending "testing if it leaks"
  end

  it "should work with value => value" do
    a = GoogleHashRuby.new
    a['abc'] = 'def'
    a['abc'].should == 'def'
  end

  it "should have better namespace" do
    pending do
      GoogleHash::Sparse
    end
  end

  it "should disallow non numeric keys" do
    lambda { @subject['33']}.should raise_error(TypeError)
  end

#  it "should allow for non numeric keys" do
    # todo instantiate new type here...
    # todo allow for floats, ints, symbols, strings [freeze 'em]
    # wait are any of those actually useful tho?
#    @subject['33'] = 33
#    @subject['33'].should == 33
#  end

  it "should return nil if key is absent" do
    @subject[33].should be_nil
  end

  it "should work with 0's" do
   @subject[0] = 'abc'
   @subject[0].should == 'abc'
  end

  

  it "should do BigNums" do
    pending "if necessary"
  end

  it "should do longs eventually" do
    pending "caring about 64 bit"
  end

  it "should do 63 bit thingy for longs on 64 bit" do
    pending "caring about 64 bit"
  end

  it "should have sets"
  it "should have Set#each"

  it "Set should have #combination calls"

  it "should have an Array for values, keys" do
    @subject[33] = 34
    @subject.keys.should == [33]
    @subject.values.should == [34]
  end
  
  it "should have an Enumerator for values, keys, on demand"
  
  it "should have a block for values, keys, on demand"
  
  it "should have real sets"
  
  it "should skip GC when native to native"

end