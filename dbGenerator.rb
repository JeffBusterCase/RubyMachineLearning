# => Array de tests generator
require 'yaml'

# => Padrão do Array
# => [-1,
# =>  tamanho do cabelo,
# =>  porcentagem de caspas no cabelo,
# =>  se é homem ou mulher #Este não valera para a produção, só no treinamento
# => ]

def generate_hOm quantos
    
    cabeloH = 0.4 #-=
    caspasH = 0.4 #+=
    cabeloM = 0.4 #+=
    caspasM = 0.4 #-=
    
    arrayHomem = []

    bakUp = quantos
    quantos = quantos / 2

    while quantos > 0
        cabelo = ((rand(1000)) * 0.001)
        while cabelo >= cabeloH
            cabelo = ((rand(1000)) * 0.001)
        end
        
        casp = ((rand(1000)) * 0.001)
        while casp <= caspasH
            casp = ((rand(1000)) * 0.001)
        end
        
        arrayHomem << Array.new([-1, cabelo, casp, 1])
        quantos -= 1
    end
    arrayMulher = []

    quantos = bakUp / 2
    while quantos > 0
        cabelo = ((rand(1000)) * 0.001)
        while cabelo <= cabeloM
            cabelo = ((rand(1000)) * 0.001)
        end        
        casp = ((rand(1000)) * 0.001)
        while casp >= caspasM
            casp = ((rand(1000)) * 0.001)
        end
        arrayMulher << Array.new([-1, cabelo, casp, -1])
        quantos -= 1
    end   

#arrayHomem, arrayMulher


    arr = []
    tmp = 0
    while bakUp > 0
        t = rand(2)
        if t == 0
           arr << arrayHomem[tmp] 
        else
           arr << arrayMulher[tmp]
        end
        bakUp -= 1
    end
    return arr
end
arr = []
numoftimes = 500
while numoftimes >= 0
    arr << generate_hOm(2)[0]
    numoftimes -= 1
end
database = arr








File.open('./db/ManOrWomanDB.db', "w"){|file|
    file.puts YAML.dump(database)
}
p YAML.load(File.read('./db/ManOrWomanDB.db'))
puts "\n\nHere I'am\n\n"
puts "\n\n\n\n\n\n Wait until the best"