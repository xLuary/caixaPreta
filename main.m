clear all; %limpa todas as variaveis
close all; %fecha todas as figuras
clc; %limpa a tela

l = 36; %tamanho do indivíduo (9 botões em que cada botão corresponde a 4 bits)

%Parâmetros do Algoritmo Genético
n = 20; %numero de individuos
numGER = 150; %numero de gerações
probCRUZ = 0.8; %probabilidade de cruzamento
probMUT = 0.025; %probabilidade de mutacao

%Repetições 
iteracao = 30;

%Gráficos
acumulado = []; %armazena a evolução do fitness durante a execução
histfitness = []; %histórico do fitness
histfitnessm = []; %serie de fitness das 30 repetições para o gráfico médio


for j = 1:iteracao
   
    POP = randi([0,1],n,l);  %gerar população inicial

    fitness = calcFitness(POP); %avaliar populacao inicial

    for i=1:numGER
     
       pais = torneio(POP,fitness);  %selecao
   
       filhos = cruzamento1p(pais,probCRUZ); %cruzamento 1 ponto de cruzamento

      
       filhosMutados = mutacao(filhos,probMUT); %mutacao gene a gene

       POPnovo = filhosMutados;

       fitnessnovo = calcFitness(POPnovo); %Executa a função de avaliação para a nova populacao

    %  substituicao
        [~,ind] = sort(fitness); %sort ordena o fitnes e me devolve o indice de cada um
        ind=ind(3:end); %remove os dois primeiros da lista ordenada de indices (piores)

        [~,indnovo] = sort(fitnessnovo,'descend'); % ordena o fitnenovo s e me devolve o indice de cada um
        indnovo=indnovo(1:2);  % dois primeiros da lista ordenada de indices (melhores)

        POP=[POP(ind,:); POPnovo(indnovo,:)]; %junta a população   
        fitness=[fitness(ind,:); fitnessnovo(indnovo,:)]; %junta o fitness

       %visualizacao
       histfitness(end+1)=max(fitness);
       figure(1);
       plot(histfitness);
       xlabel('Geração');
       ylabel('Sinal máximo');
       

    end
       
    acumulado=[acumulado; histfitness]; 
    media=mean(acumulado);
    figure(2);
    plot(media);
    xlabel('Geração');
    ylabel('Sinal de saída');
    

    histfitness=[];

end

max(fitness);
[~,indm]=sort(fitness,'descend');
melhor=indm(1:1);
melhorsolucao=POP(melhor,:);

% visualizacao do melhor resultado e fitness
disp('Melhor fitness:');
disp(max(fitness));
disp('Melhor indivíduo:');
disp(melhorsolucao);


