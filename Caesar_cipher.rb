def codificar (texto, n=13) 
    resultado = '' 
    texto.each_char do |letra| 
        n.times { letra = letra.next[0] } if letra.match(/[a-zA-Z]/) 
        resultado << letra 
    end 
    resultado 
end 
 
def decodificar (texto, n=13) 
    n = n % 26 
    n = 26 - n 
    codificar(texto, n) 
end 
codificar("Me duele la cara de ser tan guapa")
