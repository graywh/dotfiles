require 'fileutils'
include FileUtils

Home = ENV["HOME"]
Externals = "externals"
Base = "base"
Local = "local/#{`uname -n`.sub("\n","")}"
$dry_run = false

def check_install(srcdir)
  srcdir = File.expand_path(File.join(File.dirname(__FILE__), srcdir))
  Dir["#{srcdir}/**/*"].each do |srcfile| 
    srcbase = srcfile.sub(%r!^#{srcdir}/!, ".")
    destfile = File.join(Home, srcbase)

    if File.exist?(destfile)
      next if File.directory?(destfile)
      next if File.symlink?(destfile) and File.readlink(destfile) == srcfile
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
    mkdir_p(destfile, :verbose => true, :noop => $dry_run)
  else
    ln_sf(srcfile, destfile, :verbose => true, :noop => $dry_run)
  end
end

desc "Don't actually do anything"
task :dryrun do
  $dry_run = true
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

desc "Update master branch"
task :update do
  branch = `git branch | grep "^*" | sed 's/\* //'`.sub("\n", "")
  system "git checkout master"
  system "git pull"
  system "git checkout #{branch}"
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
          mkdir_p(destfile, :verbose => true) unless File.exist?(destfile)
        else
          cp(srcfile, destfile, :verbose => true)
        end
      end
    end
    %w{vim-rails vim-surround vim-speeddating vim-git vim-ruby}.each do |name|
      puts "=== #{name} ==="
      do_merge("#{Externals}/#{name}", "#{Base}/vim")
    end
  end
end
