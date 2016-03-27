require 'yaml'
require './rand_generator'




# 
#
#
#
# => This version uses the DB with more than 400 arrays of mans and womans
#
#
#
#


dbf = './db/ManOrWomanDB.db'
db = YAML.load(File.read(dbf))

n = 0.023#Constante da taxa de Aprendizado

todas_amostras = db

epoca = 0

erro = false
vetores_w = []
vetor_w = randg 3
arr_De_zeros = [0]
arr_de_arrs = []
while arr_De_zeros.include? 0 # Enquanto ele conter zeros(erros) ele irá treinar!
    ponder = []
    arr_De_zeros = []
    for vetor in todas_amostras do
        
        #Pondera
        tmp = 0
        for x in vetor 
            next if x.object_id == vetor.last.object_id
            ponder[tmp] = vetor_w[tmp] * x
            
            tmp += 1
        end
        #Guarda o vetor
        vetores_w << vetor_w
        
        u = 0
        ponder.each { |wx|
            u += wx
        }
        puts "The u value: #{u} :"
        (u >= 0)? y = 1 : y = -1
        
        puts "Acho que é #{y} e é #{vetor.last}"
        if y != vetor.last # Se é 1 ou -1
            arrn = []
            tmp = 0
            while tmp < (vetor.length - 1)
                arrn << vetor_w[tmp] + (n * (vetor.last - y) * vetor[tmp]) 
                tmp += 1
            end
            vetor_w = arrn
            puts 'Errei'
            arr_De_zeros << 0
        else
            arr_De_zeros << 1
            puts "Acertei"
        end
        
        arr_de_arrs << arr_De_zeros
    end
    epoca += 1
end

puts "Vetor final foi o " + vetor_w.to_s
puts "Treinou #{epoca} vezes"
puts "Arr_de_zeros: #{arr_de_arrs.to_s }"
puts "Ultimo arr_de_zeros: #{arr_de_arrs.last}"

File.open('./db/bestVectors.db', 'w'){|f|
    f.puts YAML.dump(vetor_w)
}