require 'fileutils'
require 'yaml'

Yobj = YAML::load(File.open('.dotfiles.yml'))

def git_stash(&block)
  system("git diff-index --exit-code HEAD > /dev/null")
  stash = $?.exitcode > 0
  if stash
    `git stash save --quiet 'dotfiles'`
  end
  block.call()
  if stash
    `git --no-pager stash pop`
  end
end

def git_master(&block)
  git_stash do
    system("git checkout master")
    block.call()
    system("git checkout local")
    system("git rebase master")
  end
end

def vimdoctags
  puts("updating vim help tags")
  system("vim --noplugin -c 'call pathogen#helptags()' -c 'q'")
end

def filter(hash, pattern)
  if pattern
    pattern = Regexp.new(pattern)
    hash.delete_if do |key, value|
      not (key =~ pattern)
    end
  end
  return hash
end

def download(url, file)
  puts("downloading #{file}")
  system("wget #{url} -O #{file}")
end

desc "Update master and rebase"
task :update do
  git_master do
    system("git pull")
  end
end

desc "Cherry pick commits for master"
task :cherry, :rev do |t, args|
  raise "no revision" unless args.rev
  git_master do
    system("git cherry-pick #{args.rev}")
  end
end

namespace :bundle do
  desc "Initialize bundles"
  task :init do
    Yobj['Bundles'].each do |key, value|
      system("git clone #{value} #{key}") unless File.exists?(key)
    end
    vimdoctags
  end

  desc "Update bundles"
  task :update, :pattern do |t, args|
    projects = filter(Yobj['Bundles'], args.pattern)
    projects.each do |key, value|
      system("cd #{key}; git checkout master; git pull")
    end
    vimdoctags
  end
end

namespace :file do
  desc "Update files"
  task :update, :pattern do |t, args|
    files = filter(Yobj['Files'], args.pattern)
    files.each do |key, value|
      download(value, key)
    end
  end
end
