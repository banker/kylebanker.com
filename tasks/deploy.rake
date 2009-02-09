
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
    Rake::SshDirPublisher.new(
        "#{SITE.user}@#{SITE.host}", SITE.remote_dir, SITE.output_dir).upload
  end

  desc 'Deploy to the server using ssh with specified port'
  task :ssh_with_port do
    Rake::SshDirPublisher.new(
        "#{SITE.user}@#{SITE.host}", SITE.port, SITE.remote_dir, SITE.output_dir).upload
  end
end
