require 'spec_helper'

describe Project do
  it { should respond_to :code } 
  it { should respond_to :name } 
  it { should respond_to :description } 
end
