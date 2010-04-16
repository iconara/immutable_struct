require File.expand_path('../spec_helper', __FILE__)


describe ImmutableStruct do
  
  class ImmutableItem < ImmutableStruct.new(:a, :b); end
  
  it 'can be used as a superclass just like Struct' do
    obj = ImmutableItem.new(1, 2)
    obj.a.should == 1
  end
  
  it 'creates no setters' do
    obj = ImmutableItem.new(1, 2)
    running { obj.a = 3 }.should raise_error
  end
  
  it 'does not allow [] to be used to mutate the instance' do
    obj = ImmutableItem.new(1, 2)
    running { obj[:a] = 3 }.should raise_error
  end
  
  it 'creates a constructor that works like the one Struct creates' do
    obj = ImmutableItem.new(1, 2)
    obj.a.should == 1
    obj.b.should == 2
    obj = ImmutableItem.new(1)
    obj.a.should == 1
    obj.b.should == nil
  end
  
  it 'creates a constructor that takes a hash' do
    obj = ImmutableItem.new(:a => 1, :b => 2)
    obj.a.should == 1
    obj.b.should == 2
    obj = ImmutableItem.new(:b => 2)
    obj.a.should == nil
    obj.b.should == 2
  end
  
  it 'adds #to_h that returns a hash representation of the object' do
    obj = ImmutableItem.new(:a => 1, :b => 2)
    obj.to_h.should have_key(:a)
    obj.to_h.should have_key(:b)
  end
  
end