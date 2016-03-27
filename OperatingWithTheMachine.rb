require 'yaml'


vector_w = YAML.load(File.read('./db/bestVectors.db'))

trainTheMachine = true

if trainTheMachine
    require './TrainingTheMachine2.rb'
    puts "\n\n\n\n Start Operation with the machine\n\n"
end
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
    ponder << part * vector_w[tmp]
    tmp += 1
end
u = 0
ponder.each {|numE|
    u += numE
}

if u >= 0
    y = 1
else
    y = -1
end
puts "É um homem" if y == 1
puts "É uma mulher" if y == -1


