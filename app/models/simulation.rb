class Simulation < ActiveRecord::Base
  belongs_to :punishment
  
  def simulate
    sleep 5
    self.dislike = rand 100 + 1
    return save
  end

  #def self.perform(options)
  #  punishment = Punishment.find options['punishment_id']
  #  simulation = punishment.simulations.new
  #  simulation.submitted_by = options['submitted_by'] + ' queued'
  #  simulation.actually_simulate
  #end    
  # @queue = :simulation
  # @delayed_jobs = true
  # @unique_jobs = true
  # QUEUE=* rake environment resque:work
  #Resque.enqueue(Simulation, { :punishment_id => punishment.id, :submitted_by => submitted_by})    
  #Resque.enable_delay(:simulation)
  #Resque.enqueue(Simulation, {:_id => submitted_by + punishment.id.to_s, :punishment_id => punishment.id, 
  #                 :submitted_by => submitted_by, :delay_until => Time.now + 300})    
end
