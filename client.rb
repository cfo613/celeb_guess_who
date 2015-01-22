require 'HTTParty'

#request ip address
puts "please enter an ip address"
ip_address = gets.chomp
ip_url = ip_address

#access ip address and return celeb object
celeb_hint = HTTParty.get(ip_url)
puts celeb_hint

#ask for celeb guess
puts "which celebrity might this be?"
guess = gets.chomp.gsub(" ", "_")
guess_url = ip_address + "/" + guess
check = HTTParty.get(guess_url)
if check["incorrect"]
  puts check["incorrect"]
elsif check["correct"]
  puts check["correct"]
end

#assess whether guess is right or wrong
while check["incorrect"]
  puts "which celebrity might this be?"
  guess = gets.chomp.gsub(" ", "_")
  guess_url = ip_address + "/" + guess
  check = HTTParty.get(guess_url)
  if check["incorrect"]
    puts check["incorrect"]
  elsif check["correct"]
    puts check["correct"]
  end
end
