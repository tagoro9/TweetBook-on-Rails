require 'flog'
require 'roodi'
require 'roodi_task'
require 'metric_fu'


  MetricFu::Configuration.run do |config|  
    config.metrics = [:reek, :roodi, :flog, :flay, :rcov, :stats, :rails_best_practices, :churn, :saikuro]
    config.graphs = [:reek, :roodi, :flog, :flay, :rcov, :stats, :rails_best_practices, :churn, :saikuro]
    #config.verbose = true
    config.template_class = StandardTemplate
    config.rcov[:rcov_opts] << "-I#{"lib:test"}"
    config.graph_engine = :gchart
  end  


desc 'Analizar complejidad del codigo'
task :flog do
  flog = Flog.new
  flog.flog_files ['app']
  threshold = 30
  
  bad_methods = flog.totals.select do |name,score|
    score > threshold
  end
  
  bad_methods.sort {|a,b| a[1] <=> b[1]}.each do |name,score|
    puts "%8.1f: %s" % [score, name]
  end
  
  raise "#{bad_methods.size} metodos tienen una complejidad flog > #{threshold}" unless bad_methods.empty? 
  
end

desc 'Repeticiones de codigo'
task :flay do
  threshold = 25
  flay = Flay.new :fuzzy => false, :verbose => false, :mass => threshold
  flay.process(*Flay.expand_dirs_to_files(['app']))
  flay.report
  
  raise "#{flay.masses.size} trozos de codigo tienen una masa de duplicado > #{threshold}" unless flay.masses.empty? 
end


#RoodiTark.new 'roodi', ['app/**/*.rb', 'lib/**/*.rb']
