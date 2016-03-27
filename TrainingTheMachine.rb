require './rand_generator'

n = 0.05#Constante da taxa de Aprendizado

homem = 1
#Saida Desejada
dK = homem
mulher = -1

vetor_homems = [
    [-1, 0.2, 0.8, 1],
    [-1, 0.1, 0.98, 1],
    [-1, 0.823, 0.73, 1],
    [-1, 0.5412, 0.43, 1]
]

vetor_mulheres = [
    [-1, 0.5, 0.13, -1],
    [-1, 0.64, 0.02, -1],
    [-1, 0.87, 0.025, -1],
    [-1, 0.506, 0.32, -1]
]
todas_amostras = []

vetor_mulheres.each {|vetor|
    todas_amostras << vetor
}

vetor_homems.each {|vetor|
    todas_amostras << vetor
}

epoca = 0

erro = true
vetores_w = []
while erro
    ponder = []
    tmp = 0
    vetor_w = randg 3
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