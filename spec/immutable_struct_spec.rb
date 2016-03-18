# encoding: utf-8

require './spec/spec_helper'


describe ImmutableStruct do
  
  class ImmutableItem < ImmutableStruct.new(:a, :b); end

  ImmutableAdder = ImmutableStruct.new(:a, :b) do
    def sum
      a + b
    end
  end
  
  it 'can be used as a superclass just like Struct' do
    obj = ImmutableItem.new(1, 2)
    obj.a.should == 1
  end

  it 'accepts a block as a class body just like Struct' do
    obj = ImmutableAdder.new(1, 2)
    obj.sum.should == 3
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

  it 'creates a strict constructor that needs all fields' do
    StrictImmutableItem = ImmutableItem.strict
    lambda { StrictImmutableItem.new(:b => 2) }.should raise_error(ArgumentError)
    lambda { ImmutableItem.new(:b => 2) }.should_not raise_error(ArgumentError)
  end
  
  it 'does not create a hash constructor for single-field instances' do
    obj = ImmutableStruct.new(:a).new(:some => :data)
    obj.a.should == {:some => :data}
  end
  
  it 'adds #to_h that returns a hash representation of the object' do
    obj = ImmutableItem.new(:a => 1, :b => 2)
    obj.to_h.should have_key(:a)
    obj.to_h.should have_key(:b)
  end
  
  it 'extends #dup so that properties can be overridden' do
    obj1 = ImmutableItem.new(:a => 1, :b => 2)
    obj2 = obj1.dup(:b => 3)
    obj2.b.should == 3
  end
  
  it "can be deserialized from YAML" do
    obj1 = ImmutableItem.new(:a => 1, :b => 2)
    yaml = YAML.dump(obj1)
    obj2 = YAML.load(yaml)
    obj2.should == obj1
  end
  
end
