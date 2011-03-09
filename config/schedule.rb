every 1.minute do
  runner "Simulation.simulate :from => 'cron'"
  rake 'simulate:invent'
  rake 'simulate:cron'
end

job_type :awesome, '/usr/local/bin/awesome :task --who_is_driving=:who_is_driving > :logfile'

every :sunday, :at => '3 pm' do
  command '/var/www/daibatsu/current/script/do_some_bash_stuff.sh'
  awesome "party", :who_is_driving => "bear", :logfile => "/var/logs/how_can_this_be.log"
end
  
