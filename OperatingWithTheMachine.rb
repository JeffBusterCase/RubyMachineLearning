require 'yaml'

# => xBia

trainTheMachine = false

if trainTheMachine
    require './TrainingTheMachine2.rb'
    tmp = gets.chomp
    system 'clear'
    puts "\n\nStart Operation with the machine\n"
end


vector_w = YAML.load(File.read('./db/bestVectors.db'))

#Start progration
# => Fase de Operação
print "\nTamanho do cabelo: "
x = (gets.chomp).to_f
print "\nQuantidade de caspa: "
y = (gets.chomp).to_f
puts x, y
rato_de_laboratorio = [-1, x, y] 

tmp = 0
ponder = []
for part in rato_de_laboratorio
    puts "x in rato_de_laboratorio: #{part}",
         "w for x in vector_w: #{vector_w[tmp]}"
    ponder << part * vector_w[tmp]
         puts "Pondered x * w: #{ponder.last}"
    tmp += 1
end
u = 0
ponder.each {|numE|
    u += numE
}

puts "U: #{u} :"

if u >= 0
    y = 1
else
    y = -1
end
puts "É um homem" if y == 1
puts "É uma mulher" if y == -1


