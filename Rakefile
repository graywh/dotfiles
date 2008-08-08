# TODO find sensible meaning and use for "force"
require 'fileutils'

Home = ENV["HOME"]
Externals = "externals"

$noop = false

desc "No-act"
task :dryrun do
  $noop = true
end

desc "Install"
task :install do
  FileUtils.cp_r('../.', Home, :noop => $noop)
end

desc "Initialize"
task :init => ["externals:init"] do
  system("git checkout -b local")
end

namespace :init do
  desc "Switch main tracking branch to origin/master"
  task :master do
    system("git branch --track master origin/master")
    system("git checkout master")
    system("git branch -D local")
    system("git checkout -b local")
  end
end

desc "Update master and rebase"
task :update do
  system("git checkout master")
  system("git pull")
  system("git checkout local")
  system("git rebase master")
end

desc "Cherry pick commits for master"
task :cherry, :rev do |t, args|
  raise "no revision" unless args.rev
  system("git checkout master")
  system("git cherry-pick #{args.rev}")
  system("git checkout local")
  system("git rebase master")
end

namespace :externals do
  desc "Initialize externals"
  task :init do
    system("git submodule update --init")
  end

  desc "Update externals" 
  task :update => ["externals:update:git"]

  namespace :update do
    desc "Git submodules"
    task :git do
      system("git submodule update")
    end

    desc "Ruby gems"
    task :gems do
      # fetch gems
      require 'rubygems/installer'
      %w{vim-ruby}.each do |name|
        FileUtils.rm_rf("#{Externals}/#{name}*", :noop => $noop)
        version = all = Gem::Requirement.default
        dep = Gem::Dependency.new name, version
        specs_and_sources = Gem::SpecFetcher.fetcher.fetch dep, all
        specs_and_sources.sort_by { |spec,| spec.version }
        spec, source_uri = specs_and_sources.last
        gem_file_name = "#{spec.full_name}.gem"

        system("wget #{source_uri}/gems/#{gem_file_name} -O #{Externals}/#{name}.gem")
        Gem::Installer.new("#{Externals}/#{name}.gem").unpack("#{Externals}/#{name}")
        FileUtils.rm("#{Externals}/#{name}.gem", :noop => $noop)
      end
    end
  end

  desc "Merge externals files"
  task :merge => [:update] do
    %w{vim-rails vim-surround vim-speeddating vim-git}.each do |name|
      puts "=== #{name} ==="
      FileUtils.cp_r("#{Externals}/#{name}/.", "../.vim", :noop => $noop)
    end
    %w{vim-ruby}.each do |name|
      puts "=== #{name} ==="
      system("#{Externals}/#{name}/bin/#{name}-install.rb -d ../.vim")
    end
  end
end
