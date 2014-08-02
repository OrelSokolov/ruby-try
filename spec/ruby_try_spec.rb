require 'spec_helper'
require 'ruby-try'

#########################################################################3

shared_context "#try, method not exists" do
  it "should return nil for general method" do
    subject.try(:non_existing_method).should eq(nil)
  end

  it "should return nil for boolean method" do
    subject.try(:non_existing_method?).should eq(nil)
  end
end

#########################################################################3

shared_context "#try?, method exists" do
  it "should raise an exception for general method" do
    expect {subject.try?(:zero) }.to raise_error(ArgumentError)
  end

end

shared_context "#try?, method not exists" do
  it "should raise an exception for general method" do
    expect {subject.try?(:non_existing_method) }.to raise_error(ArgumentError)
  end

  it "should return false for boolean method" do
    subject.try?(:non_existing_method?).should eq(false)
  end
end


#########################################################################3

shared_context "object with try" do
  before do
    allow_message_expectations_on_nil
    subject.stub(:get_zero).and_return(0)
    subject.stub(:zero?).and_return(true)
  end

  it { should respond_to(:try)  }
  it { should respond_to(:try?) }
  it { should respond_to(:try!) }

  it { should_not respond_to(:non_existing_method) }
  it { should_not respond_to(:non_existing_method?) }

end

describe Object do
  include_context 'object with try'


  ###############################################################################

  describe "#try" do
    context "for existing method" do
      it "should return value for general method" do
        subject.try(:get_zero).should eq(0)
      end

      it "should return value for boolean method" do
        subject.try(:zero?).should eq(true)
      end
    end

    context "for non-existing method" do
      include_context "#try, method not exists" 
    end

  end

  ###############################################################################

  describe "#try?" do
    context "for existing method" do
      include_context "#try?, method exists" 
      
      it "should return value for boolean method" do
        subject.try?(:zero?).should eq(true)
      end
    end

    context "for non-existing method" do
      include_context "#try?, method not exists" 

    end
  end

  ###############################################################################

  describe "#try!" do
    context "for existing method" do
      it "should return value for general method" do
        subject.try!(:get_zero).should eq(0)
      end

      it "should return value for boolean method" do
        subject.try!(:zero?).should eq(true)
      end
    end

    context "for non-existing method" do
      it "should raise an exception for general method" do
        expect {subject.try!(:non_existing_method) }.to raise_error(NoMethodError)
      end

      it "should raise an exception for boolean method" do
        expect {subject.try!(:non_existing_method?) }.to raise_error(NoMethodError)
      end
    end
  end

end

describe NilClass do
  subject { nil }
  include_context 'object with try'

  ###############################################################################

  describe "#try" do
    context "for existing method" do
      it "should return nil for general method" do
        subject.try(:get_zero).should eq(nil)
      end

      it "should return nil for boolean method" do
        subject.try(:zero?).should eq(nil)
      end
    end

    context "for non-existing method" do
      it "should return nil for general method" do
        subject.try(:get_zero).should eq(nil)
      end

      it "should return nil for boolean method" do
        subject.try(:zero?).should eq(nil)
      end
    end


  end

  ###############################################################################

  describe "#try?" do
    context "for existing method" do
      include_context "#try?, method exists" 

      it "should return value for boolean method" do
        subject.try?(:zero?).should eq(true)
      end
    end

    context "for non-existing method" do
      include_context "#try?, method not exists" 
    end
  end

  ###############################################################################

  describe "#try!" do
    context "for existing method" do

      it "should return nil for boolean method" do
        subject.try!(:zero?).should eq(nil)
      end

      it "should return nil for general method" do
        subject.try!(:get_zero).should eq(nil)
      end
    end

    context "for non-existing method" do

      it "should return nil for general method" do
        subject.try!(:non_existing_method).should eq(nil)
      end

      it "should return nil for boolean method" do
        subject.try!(:non_existing_method?).should eq(nil)
      end
    end

  end

end
