function filhos = mutacao(filhos,probMUT)
[tamanho,genes] = size(filhos);
for i = 1:tamanho
    for j = 1:genes
        if rand(1) <= probMUT
            filhos(i,j) = not(filhos(i,j));
        end    
    end
end