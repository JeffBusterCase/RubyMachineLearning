
#Random number generator from instancies where -1 < w < 1
def randg i 
    arr = []
    while i > 0
        (rand(2) == 0)? (e = rand * -1) : e = rand
        i -= 1
        arr << e
    end
    return arr
end

