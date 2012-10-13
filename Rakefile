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
  print_text("*** Updating vim help tags", :color => 6)
  system("vim --noplugin -c 'call pathogen#helptags()' -c 'q'")
end

def filter(hash, pattern)
  if pattern
    pattern = Regexp.new(pattern)
    hash.delete_if do |key, value|
      not (key =~ pattern)
    end
  end
  hash.each do |key, value|
    yield key, value
  end
end

def download(url, file)
  print_text("*** Downloading #{file}", :color => 6)
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
  task :init, :pattern do |t, args|
    filter(Yobj['Bundles'], args.pattern) do |key, value|
      unless File.exists?(key)
        print_text("*** Initializing #{key}", :color => 2)
        system("git clone #{value} #{key}")
      end
    end
    vimdoctags
  end

  desc "Update bundles"
  task :update, :pattern do |t, args|
    filter(Yobj['Bundles'], args.pattern) do |key, value|
      if Dir.exists?(key)
        print_text("*** Updating #{key}", :color => 2)
        system("cd #{key} && git checkout master && git pull")
      else
        print_text("*** Bundle #{key} not initialized", :color => 1)
      end
    end
    vimdoctags
  end

  desc "List bundles"
  task :list, :pattern do |t, args|
    filter(Yobj['Bundles'], args.pattern) do |key, value|
      print_text("#{key} => #{value}")
    end
  end
end

namespace :file do
  desc "Update files"
  task :update, :pattern do |t, args|
    filter(Yobj['Files'], args.pattern) do |key, value|
      download(value, key)
    end
  end

  desc "List files"
  task :list, :pattern do |t, args|
    filter(Yobj['Files'], args.pattern) do |key, value|
      print_text("#{key} => #{value}")
    end
  end
end
