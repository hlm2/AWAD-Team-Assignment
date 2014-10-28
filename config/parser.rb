
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
  firstcomma = line.index(',')
  stringf = line[0,line.index(',')]
  stringe = line[line.index(','),line.length-line.index(',')]
  control = stringf
  line = stringe
  
  #gets loans
  lastcomma = line.rindex(',')
  stringf = line[1,line.rindex(',')-1]
  stringe = line[line.rindex(',')+1,line.length-line.rindex(',')-1]
  loans=stringe.to_i()
  line = stringf
  
#gets writer
  slash = line.index('/')
  author = line[slash+2, line.length-line.index('/')]

#removes unused data
  line = line[line.rindex(',')+1,line.length-line.rindex(',')-1]
  
 #gets title
  title = line.split('/')[0]
    
  puts control
  puts title 
  puts author
  puts loans
  puts '/'
  
  @books = Book.new
  @books.control = control
  @books.title = title
  @books.author = author
  @books.loans = loans
  @books.save #formerly @word.create
  
  
end
f.close
