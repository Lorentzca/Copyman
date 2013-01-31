class Copyman
  require 'fileutils'
  include FileUtils

  def initialize
    current = Dir.getwd
    printf "[current directory] %s\n", current
  end

  def findAndCopy
    printf("Directory -> ")
    findDir  = gets.chomp
    printf("Name -> ")
    fileName = gets.chomp
    printf("Dest directory -> ")
    destDir  = gets.chomp
    target   = findDir + "/**/" + fileName

    puts "[start search]"
    printf " Dir -> %s\n", findDir
    printf " FileName -> %s\n", fileName
    printf " target -> %s\n", target
    printf " copy %s -> %s \n",target,destDir

    printf("ok? enter yes or no -> ")
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
