require 'mongo'

class SimulationsController < ApplicationController
  def index
    @simulations = Simulation.all
    @punishments = Punishment.all
    @jobs = Mongo::Connection.new['resque']['simulation'].find().to_a
  end

  def simulate
    @punishment = Punishment.find(params[:punishment])
    @simulation = @punishment.simulations.new
    @simulation.submitted_by = "Website"
    if @simulation.simulate
      flash[:error] = "Simulated #{@punishment.name}"
    else
      flash[:error] = "Simulation failed!"
    end
    
    redirect_to :action => :index
  end    
end
