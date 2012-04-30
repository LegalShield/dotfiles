def symlink(target, link)
  puts "Linking #{link} => #{target}"

  if File.symlink?(link)
    unlink(link)
  elsif File.exist?(link)
    puts "ERROR: File exists: #{link}"
    exit 1
  end
  File.symlink(target, link)
end

def delete_symlink(link)
  unlink(link) if File.symlink?(link)
end

def unlink(link)
  if File.exist?(link)
    descriptor = File.symlink?(link) ? "symlink" : "file"
    puts "Deleting #{descriptor} #{link}"
    File.unlink(link)
  end
end

def pwd; File.dirname(__FILE__); end

def target_path(file)
  File.join(ENV["HOME"], ".#{file}")
end

files = File.new(File.join(pwd, "MANIFEST"), "r").read.split("\n")

desc "Install all dotfiles"
task :install => [:init_submodules, :update] do
  files.each do |file|
    symlink(File.join(pwd, file), target_path(file))
  end
end

desc "Remove all dotfies"
task :uninstall do
  files.each do |file|
    unlink(target_path(file))
  end
end

task :init_submodules do
  puts "Installing submodules"
  `git submodule init`
end

desc "Update VIM plugins"
task :update do
  puts "Updating submodules"
  `git submodule update`
end