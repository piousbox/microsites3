
def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

namespace :ish do

  desc "migrate"
  task :migrate => :environment do
    # create indexes
    # Rake::Task['db:mongoid:create_indexes'].invoke
  end

end
