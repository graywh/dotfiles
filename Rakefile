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
  print_text("Updating vim help tags", :color => 6)
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
  print_text("Downloading #{file}", :color => 6)
  system("wget #{url} -O #{file}")
end

def print_text(text, args={})
  color = args[:color]
  system("tput setaf #{color}") if color
  puts(text)
  system("tput sgr0") if color
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
      print_text("*** Initializing #{key}", :color => 2)
      system("git clone #{value} #{key}") unless File.exists?(key)
    end
    vimdoctags
  end

  desc "Update bundles"
  task :update, :pattern do |t, args|
    projects = filter(Yobj['Bundles'], args.pattern)
    projects.each do |key, value|
      print_text("*** Updating #{key}", :color => 2)
      system("cd #{key} && git checkout master && git pull")
    end
    vimdoctags
  end

  desc "List bundles"
  task :list, :pattern do |t, args|
    projects = filter(Yobj['Bundles'], args.pattern)
    projects.each do |key, value|
      print_text("#{key} => #{value}")
    end
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
