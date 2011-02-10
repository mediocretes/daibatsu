class Simulation < ActiveRecord::Base
  belongs_to :punishment
  @queue = :simulation
  @unique_jobs = true
  @delayed_jobs = true
  
  def simulate
    Resque.enable_delay(:simulation)
    Resque.enqueue(Simulation, {:_id => submitted_by + punishment.id.to_s, :punishment_id => punishment.id, :delay_until => Time.now + 60, :submitted_by => submitted_by})
  end

  def actually_simulate
    sleep 5
    self.dislike = rand 100 + 1
    return save
  end  

  def self.perform(options)
    punishment = Punishment.find(options['punishment_id'])
    simulation = punishment.simulations.new
    simulation.submitted_by = options['submitted_by']
    simulation.actually_simulate
  end    
end
