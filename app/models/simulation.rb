class Simulation < ActiveRecord::Base
  belongs_to :punishment

  def actually_simulate
    self.dislike = rand 100 + 1
    return save
  end  

  def self.perform(options)
    punishment = Punishment.find(options['punishment_id'])
    simulation = punishment.simulations.new
    simulation.submitted_by = options['submitted_by']
    simulation.actually_simulate
  end    
  
  def self.simulate(options)
    Punishment.find(:all).each do |punishment|
      simulation = punishment.simulations.new
      simulation.submitted_by = options[:from]
      simulation.actually_simulate
    end
  end
end
