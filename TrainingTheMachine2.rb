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

n = 0.05#Constante da taxa de Aprendizado

todas_amostras = db

epoca = 0

erro = true
vetores_w = []
vetor_w = randg 3
while erro
    ponder = []
    tmp = 0
    
    for vetor in todas_amostras do
        next if vetor[3] == vetor[tmp] 
        #Guarda o vetor
        vetores_w << vetor_w
        
        ponder[tmp] = vetor_w[tmp] * vetor[tmp]
        tmp += 1
        u = 0
        ponder.each { |vector|
            u += vector
        }
        (u >= 0)? y = 1 : y = -1
        
        puts "Acho que é #{y} e é #{vetor[3]}"
        if y != vetor[3] # Se é 1 ou -1
            tmp = 0
            arrn = []
            while tmp < (vetor.length - 1)
                arrn << vetor_w[tmp] + (n * (vetor[3] - y) * vetor[tmp]) 
                tmp += 1
            end
            vetor_w = arrn
            puts 'Errei'
            erro = true
        else
            puts "Acertei"
            erro = false
        end
        
        
        
    end

    epoca += 1
end

puts "Vetor final foi o " + vetor_w.to_s
puts "Treinou #{epoca} vezes"


File.open('./db/bestVectors.db', 'w'){|f|
    f.puts YAML.dump(vetor_w)
}