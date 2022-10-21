function filhos = cruzamento1p(pais,probCRUZ)
filhos = zeros(size(pais));
[tamanho,genes] = size(pais); 
tamanhoprob= length(pais);
for i = 1:2:tamanho
    
    if rand(1) <= probCRUZ %Verifica se vai cruzar se for menor que 0.8 
            pontoCorte = ceil(tamanhoprob*rand(1));
            %Gera os filhos     
            filhos(i,:) = [pais(i,1:pontoCorte) pais(i+1,pontoCorte+1:genes)];
            filhos(i+1,:) = [pais(i+1,1:pontoCorte) pais(i,pontoCorte+1:genes)];

          if tamanho-1 == i && mod(tamanho,2) == 1 %Passa pai para proxima geracao, caso nao tenha par
             filhos(i+2,:) = pais(i+2,:);
        end
    end
end    