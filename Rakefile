require 'fileutils'
require 'yaml'

Yobj = YAML::load(File.open('.dotfiles.yaml'))

Home = ENV["HOME"]
DownloadCmd = "wget -O"

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

def vimdoctags(bundles)
  puts("updating vim help tags")
  bundles.each do |bundle|
    system("vim -c 'helptags #{bundle}/doc' -c 'q'")
  end
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
    vimdoctags(Yobj['VimBundles'])
  end

  namespace :update do
    desc "Git submodules"
    task :git do
      system("git submodule foreach git checkout master")
      system("git submodule foreach git pull")
      vimdoctags(Yobj['VimBundles'])
    end

    desc "Files"
    task :files, :pattern do |t, args|
      files = Yobj['Files']
      if args.pattern
        pattern = Regexp.new(args.pattern)
        files.delete_if do |key, value|
          not (key =~ pattern)
        end
      end
      files.each do |key, value|
        puts("downloading #{key}")
        system("#{DownloadCmd} #{key} #{value}")
      end
    end
  end
end
