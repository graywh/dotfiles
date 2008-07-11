# TODO find sensible meaning and use for "force"
require 'fileutils'

Home = ENV["HOME"]
Externals = "externals"
Base = "base"
# :copy, :symlink
InstallMethod = :symlink

$noop = false
$force = false

def check_install(srcdir)
  srcdir = File.expand_path(File.join(File.dirname(__FILE__), srcdir))
  all = false
  Dir["#{srcdir}/**/*"].each do |srcfile| 
    destfile = name_switch(srcfile, srcdir, ".", Home)
    if File.exist?(destfile) and not all
      next if File.directory?(destfile)
      next if same_file?(destfile, srcfile)
      begin
        print "#{destfile} exists; overwrite? [Ynaqd] "
        choice = $stdin.gets.chomp
        case choice 
        when '', 'y'
          do_install(srcfile, destfile)
        when 'n'
        when 'a'
          all = true
          do_install(srcfile, destfile)
        when 'q'
          return
        when 'd'
          system "diff -u #{destfile} #{srcfile} | less -S"
          choice = nil
        else
          choice = nil
        end
      end while choice.nil?
    else
      do_install(srcfile, destfile)
    end
  end
end

def name_switch(srcfile, srcdir, replacement, destdir)
  srcbase = srcfile.sub(%r!^#{srcdir}/!, replacement)
  return File.join(destdir, srcbase)
end

def same_file?(srcfile, destfile)
  case InstallMethod
  when :copy
    return FileUtils.identical?(srcfile, destfile)
  when :symlink
    return File.identical?(srcfile, destfile)
  end
end

def do_install(srcfile, destfile)
  if File.directory?(srcfile)
    FileUtils.mkdir_p(destfile, :verbose => true, :noop => $noop)
  else
    case InstallMethod
    when :copy
      FileUtils.cp(srcfile, destfile, :verbose => true, :noop => $noop)
    when :symlink
      FileUtils.ln_sf(srcfile, destfile, :verbose => true, :noop => $noop)
    end
  end
end

def do_merge(srcdir, destdir)
  Dir["#{srcdir}/**/*"].each do |srcfile|
    next if %w{README Rakefile ChangeLog CONTRIBUTORS FAQ INSTALL NEWS bin vim-ruby-install.rb}.include?(File.basename(srcfile))

    destfile = name_switch(srcfile, srcdir, "", destdir)
    if File.directory?(srcfile)
      FileUtils.mkdir_p(destfile, :verbose => true, :noop => $noop) unless File.exist?(destfile)
    else
      FileUtils.cp(srcfile, destfile, :verbose => true, :noop => $noop)
    end
  end
end

task :default => ["dryrun", "init", "install"]

desc "Make install:base, externals:merge no-act"
task :dryrun do
  $noop = true
end

desc "Install all files"
task :install do
  check_install(Base)
end

desc "Initialize"
task :init => ["externals:init"] do
  system "git checkout -b local"
end

namespace :init do
  desc "Switch main tracking branch to origin/master"
  task :master do
    system "git branch --track master origin/master"
    system "git checkout master"
    system "git branch -D local"
    system "git checkout -b local"
  end
end

desc "Add files to be tracked"
task :add, :file do |t, args|
  raise "no file" unless args.file
  srcfile = args.file
  destfile = name_switch(srcfile, "#{Home}/.", "", Base)
  FileUtils.mkdir_p(File.dirname(destfile), :verbose => true, :noop => $noop)
  case InstallMethod
  when :copy
    FileUtils.cp(srcfile, destfile, :verbose => true, :noop => $noop)
  when :symlink
    FileUtils.mv(srcfile, destfile, :verbose => true, :noop => $noop)
    FileUtils.ln_sf(srcfile, destfile, :verbose => true, :noop => $noop)
  end
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
    %w{vim-rails vim-surround vim-speeddating vim-git vim-ruby}.each do |name|
      puts "=== #{name} ==="
      do_merge("#{Externals}/#{name}", "#{Base}/vim")
    end
  end
end
