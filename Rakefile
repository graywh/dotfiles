# TODO add options for cp, ln, and ln -s
# TODO find sensible meaning and use for "force"
require 'fileutils'
include FileUtils

Home = ENV["HOME"]
Externals = "externals"
Base = "base"
Local = "local/#{`uname -n`.sub("\n","")}"

$noop = false

def check_install(srcdir)
  srcdir = File.expand_path(File.join(File.dirname(__FILE__), srcdir))
  Dir["#{srcdir}/**/*"].each do |srcfile| 
    srcbase = srcfile.sub(%r!^#{srcdir}/!, ".")
    destfile = File.join(Home, srcbase)

    if File.exist?(destfile)
      next if File.directory?(destfile)
      next if File.identical?(destfile, srcfile)
      #next if compare_file(srcfile, destfile)
      if compare_file(srcfile, destfile)
        do_install(srcfile, destfile)
      else
        begin
          print "#{destfile} exists; overwrite? [Ynd] "
          choice = $stdin.gets.chomp
          case choice 
          when '', 'y'
            do_install(srcfile, destfile)
          when 'n'
          when 'd'
            system "diff -u #{destfile} #{srcfile} | less -S"
            choice = nil
          else
            choice = nil
          end
        end while choice.nil?
      end
    else
      do_install(srcfile, destfile)
    end
  end
end

def do_install(srcfile, destfile)
  if File.directory?(srcfile)
    mkdir_p(destfile, :verbose => true, :noop => $noop)
  else
    ln(srcfile, destfile, :verbose => true, :noop => $noop)
  end
end

task :default => ["dryrun", "init", "install"]

desc "Make install:base, externals:merge no-act"
task :dryrun do
  $noop = true
end

desc "Install all files"
task :install => ["install:base", "install:local"]

namespace :install do
  desc "Install base files"
  task :base do
    check_install(Base)
  end

  desc "Install system-specific files"
  task :local do
    check_install(Local)
  end
end

desc "Initialize"
task :init => ["externals:init"] do
  system "git checkout -b local"
end

desc "Add files to be tracked"
task :add, :file do |t, args|
  raise "no file" unless args.file
  srcfile = args.file
  destfile = args.file.sub(Home, base)
end

desc "Update master and rebase"
task :update do
  system "git checkout master"
  system "git pull"
  system "git checkout local"
  system "git rebase master"
end

desc "Cherry pick commits for master"
task :cherry, :rev do |t, args|
  raise "no revision" unless args.rev
  system "git checkout master"
  system "git cherry-pick #{args.rev}"
  system "git checkout local"
  system "git rebase master"
end

namespace :externals do
  desc "Initialize externals"
  task :init do
    system "git submodule update --init"
  end

  desc "Update externals" 
  task :update do
    system "git submodule update"

    # fetch gems
    #require 'rubygems/installer'
    #%w{vim-ruby}.each do |name|
    #  system "rm -fr externals/#{name}*"
    #  version = all = Gem::Requirement.default
    #  dep = Gem::Dependency.new name, version
    #  specs_and_sources = Gem::SpecFetcher.fetcher.fetch dep, all
    #  specs_and_sources.sort_by { |spec,| spec.version }
    #  spec, source_uri = specs_and_sources.last
    #  gem_file_name = "#{spec.full_name}.gem"

    #  system "wget #{source_uri}/gems/#{gem_file_name} -O externals/#{name}.gem"
    #  Gem::Installer.new("externals/#{name}.gem").unpack("externals/#{name}")
    #  rm "externals/#{name}.gem"
    #end
  end

  desc "Merge externals files"
  task :merge => [:update] do
    def do_merge(srcdir, destdir)
      Dir["#{srcdir}/**/*"].each do |srcfile|
        next if %w{README Rakefile ChangeLog CONTRIBUTORS FAQ INSTALL NEWS bin vim-ruby-install.rb}.include?(File.basename(srcfile))

        srcbase = srcfile.sub(%r!^#{srcdir}/!, "")
        destfile = File.join(destdir, srcbase)
        if File.directory?(srcfile)
          mkdir_p(destfile, :verbose => true, :noop => $noop) unless File.exist?(destfile)
        else
          cp(srcfile, destfile, :verbose => true, :noop => $noop)
        end
      end
    end
    %w{vim-rails vim-surround vim-speeddating vim-git vim-ruby}.each do |name|
      puts "=== #{name} ==="
      do_merge("#{Externals}/#{name}", "#{Base}/vim")
    end
  end
end
