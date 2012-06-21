require 'spec_helper'

describe Project do
  it { should respond_to :code } 
  it { should respond_to :name } 
  it { should respond_to :description } 
  it { should respond_to :status } 
  it { should respond_to :commission } 
  it { should respond_to :address } 
  it { should respond_to :city } 
  it { should respond_to :state } 
  it { should respond_to :country } 
  it { should respond_to :started_at } 
  it { should respond_to :ended_at } 
  it { should respond_to :gfa } 
  it { should respond_to :exterior_area } 
  it { should respond_to :budget } 
end
