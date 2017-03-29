def greeting
greeting_choice = ARGV.first
ARGV.each do |n|
	puts "#{greeting_choice} #{n}"
end
end
greeting

