#!/usr/bin/env ruby
# frozen_string_literal: true

# This script saves a snapshot of the user's webcam to ~/.gitshots every time
# they push to a remote repository.
unless File.exist?(`which imagesnap`.strip)
  puts "Please install imagesnap: brew install imagesnap"
  exit 1
end

gitshot_dir = File.join(Dir.home, ".gitshots")
unless Dir.exist?(gitshot_dir)
  puts "Creating ~/.gitshots"
  Dir.mkdir(gitshot_dir)
end

file = File.join(gitshot_dir, "#{Time.now.to_i}.jpg")
read = %x{
while read line; do
  if [[ -z $line ]]
  then
    exit
  fi
  echo $line
done
}
exit if read.empty?
values = read.split("\n")
puts "readlines: #{values}"

_local_ref, local_sha, _remote_ref, remote_sha = read.split

zero = %x(git hash-object --stdin </dev/null | tr '[0-9a-f]' '0')
unless local_sha == zero && remote_sha == local_sha
  puts "Taking capture into #{file}"
  system "imagesnap -q -w 3 #{file} &"
end
