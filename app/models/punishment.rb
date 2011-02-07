class Punishment < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :responses
  has_many :simulations
  
  def get_results(value)
    self.responses.find_all_by_appropriate_when(value).size
  end

  def average_simulation
    simulations.count == 0 ? 0 : simulations.inject(0.0){ |sum, item| sum += item.dislike.to_f} / simulations.count
  end  
end
