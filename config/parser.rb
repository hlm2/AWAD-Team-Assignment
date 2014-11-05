
RAILS_ENV = 'development'
require File.expand_path('../environment', __FILE__)

f = File.open("libraryloans.txt")

firstline = true

f.each do |line|
  #removes invisible ? at start of file
  if firstline
    line=line[1,line.length]
    firstline = false
  end
  
  #gets control
  control = line[0,line.index(',')]
  line = line[line.index(','),line.length-line.index(',')]
  
  #gets loans
  loans=line[line.rindex(',')+1,line.length-line.rindex(',')-1].to_i()
  line = line[1,line.rindex(',')-1]
  
#gets writer
  author = line[line.index('/')+2, line.length-line.index('/')]

#removes unused data
  line = line[line.rindex(',')+1,line.length-line.rindex(',')-1]
  
 #gets title
  title = line.split('/')[0]
  
  puts title 
  
  @books = Book.new
  @books.control = control
  @books.title = title
  @books.author = author
  @books.loans = loans
  @books.save #formerly @word.create
  
  
end
f.close
