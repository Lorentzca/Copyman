class Copyman
  require 'fileutils'
  include FileUtils

  def initialize
    current = Dir.getwd
    puts "[current Dir]"
    printf " -> %s\n", current
  end

  def findAndCopy
    puts "[enter FullPath dir, file and dest directory]"
    findDir  = gets.chomp
    fileName = gets.chomp
    destDir  = gets.chomp
    target   = findDir + "/**/" + fileName

    puts "[start search]"
    printf " Dir -> %s\n", findDir
    printf " FileName -> %s\n", fileName
    printf " target -> %s\n", target
    printf " copy %s -> %s \n",target,destDir

    puts "ok? enter yes or no"
    yon = gets.chomp

    if yon == "yes" then
      Dir.glob(target).each {|files|
        FileUtils.cp(files, destDir)
        printf("success! %s -> %s \n",files,destDir)
      }
    else
      puts " quit, bye"
      exit
    end

  end
end

run = Copyman.new
run.findAndCopy
