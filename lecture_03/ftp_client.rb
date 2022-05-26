ftp = Net::FTP.new('ftp.vim.org')
ftp.login
files = ftp.list('*')
puts files
