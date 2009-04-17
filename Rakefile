# TODO find sensible meaning and use for "force"
require 'fileutils'

Home = ENV["HOME"]
Externals = "externals"

$noop = false

def stash(&block)
  stash = system("git --no-pager status > /dev/null")
  if stash > 0
    system("git stash save")
  end
  block.call()
  if stash > 0
    system("git --no-pager stash pop > /dev/null")
  end
end

desc "No-act"
task :dryrun do
  $noop = true
end

desc "Update master and rebase"
task :update do
  stash do
    system("git checkout master")
    system("git pull")
    system("git checkout local")
    system("git rebase master")
  end
end

desc "Cherry pick commits for master"
task :cherry, :rev do |t, args|
  raise "no revision" unless args.rev
  stash do
    system("git checkout master")
    system("git cherry-pick #{args.rev}")
    system("git checkout local")
    system("git rebase master")
  end
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
      %w{vim-rails vim-ruby vim-surround vim-speeddating vim-git vim-haml}.each do |name|
        system("cd #{Externals}/#{name}")
        system("git checkout master")
        system("git pull")
        system("cd ../..")
      end
    end
  end

  desc "Merge externals files"
  task :merge => ["externals:merge:install","externals:merge:plain"]

  namespace :merge do
    desc "Plain copy"
    task :plain do
      %w{vim-haml vim-surround vim-speeddating vim-git}.each do |name|
        puts "=== #{name} ==="
        FileUtils.cp_r("#{Externals}/#{name}/.", "../.vim", :noop => $noop)
      end
    end

    desc "Install script"
    task :install do
      # Use installation script
      system("#{Externals}/vim-ruby/bin/vim-ruby-install.rb -d ../.vim")
      # Install with rake
      %w{vim-rails}.each do |name|
        puts "=== #{name} ==="
        system("cd #{Externals}/#{name}")
        system("rake install #{Home}")
      end
    end
  end
end