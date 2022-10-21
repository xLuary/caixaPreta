function selecionados = torneio(POP,fitness)
    selecionados= zeros(size(POP)); %gera matriz de zeros do tamanho da populacao
    tamanhoprob= size(POP,1); %retorna o tamanho da populacao
    
    for i = 1:tamanhoprob %tamanho da populacao
        ind1 = ceil(tamanhoprob*rand(1)); %retorna um numero aleatorio de 1 ao tamanho da populacao
        ind2 = ceil(tamanhoprob*rand(1)); %retorna um numero aleatorio de 1 ao tamanho da populacao
        if fitness(ind1) < fitness(ind2) %se o fitnes do indivio 1 for menor que o do individuo 2
            menor = ind1; %salva 1 como menor
            maior = ind2; %salva 2 como maior
        else %se não
            menor = ind2; %salva 2 como menor
            maior = ind1; %salva 1 como maior
        end    
    selecionados(i,:) = POP(maior,:); %adiciona o maior na populacao
end