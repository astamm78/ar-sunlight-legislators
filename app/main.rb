require_relative '../db/config'

## Part 1 #####################

def find_by_state(state)
  puts "Senator:"
  Politician.where(:state => state, :title => 'Sen').order(:lastname).each { |pol| politician_printer(pol) }
  puts "Representative:"
  Politician.where(:state => state, :title => 'Rep').order(:lastname).each { |pol| politician_printer(pol) }
end

def politician_printer(politician)
  puts "  #{politician.firstname} #{politician.lastname} (#{politician.party})"
end

find_by_state('IL')

## Part 2 #####################

male_sen = Politician.where(:in_office => true, :gender => 'M', :title => 'Sen').count
total_sen = Politician.where(:in_office => true, :title => 'Sen').count

male_rep = Politician.where(:in_office => true, :gender => 'M', :title => 'Rep').count
total_rep = Politician.where(:in_office => true, :title => 'Rep').count

puts ""
puts "Male Senators: #{male_sen} (#{ (male_sen.to_f / total_sen).*(100).to_i}%)"
puts ""
puts "Male Representatives: #{male_rep} (#{ (male_rep.to_f / total_rep).*(100).to_i}%)"

## Part 3 #####################

Politician.order.count(:group => 'state').sort { |k, v| v[1] <=> k[1] }.each do |state, count|
  reps = Politician.where(:state => state, :in_office => true, :title => 'Rep').count
  sens = Politician.where(:state => state, :in_office => true, :title => 'Sen').count
  puts "#{state}: #{reps} Reps., #{sens} Sens."
end

## Part 4 #####################

puts ""
puts "#{Politician.where(:title => 'Sen').count}  Senators"
puts "#{Politician.where(:title => 'Rep').count}  Representatives"

## Part 5 #####################

Politician.where(:in_office => 'f').destroy_all

## Part 6 #####################

puts ""
puts "#{Politician.where(:title => 'Sen').count}  Senators"
puts "#{Politician.where(:title => 'Rep').count}  Representatives"
