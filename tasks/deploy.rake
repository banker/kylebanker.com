
require File.join(File.dirname(__FILE__), '..', 'lib', 'rake', 'sshpublisher.rb')

namespace :deploy do

  desc 'Deploy to the server using rsync'
  task :rsync do
    cmd = "rsync #{SITE.rsync_args.join(' ')} "
    cmd << "#{SITE.output_dir}/ #{SITE.user}@#{SITE.host}:#{SITE.remote_dir}"
    sh cmd
  end

  desc 'Deploy to the server using ssh'
  task :ssh do
  puts SITE.port
    Rake::SshDirPublisher.new(
        "#{SITE.user}@#{SITE.host}", SITE.port, SITE.remote_dir, SITE.output_dir).upload
  end

end
