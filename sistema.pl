% Sistema recomendador de Hidromel
% Eduardo Borges Siqueira, 19100523
% Rafael Moresco Vieira, 19200435

% Tipos de encorpamento
tipo_Corpo(leve).
tipo_Corpo(medio_encorpado).
tipo_Corpo(encorpado).

% Tipos de aroma
tipo_Aroma(frutado).
tipo_Aroma(especiarias).
tipo_Aroma(natural).

% Tipos de carbonação
tipo_Carbonacao(espumante).
tipo_Carbonacao(still).

% Tipos de doçura
tipo_Docura(seco).
tipo_Docura(semiseco).

% Tipos de teor alcoolico
tipo_TeorAlcool(short).
tipo_TeorAlcool(great).

% Nomes dos tipos de hidromel
nome_tipo(tradicional, "Tradicional").
nome_tipo(bochet, "Bochet").
nome_tipo(braggot, "Braggot").
nome_tipo(melomel, "Melomel").
nome_tipo(metheglin, "Metheglin").

% Definição dos atributos por tipo de hidromel
atributos_tipo(tradicional, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = medio_encorpado), (Aroma = natural), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.
atributos_tipo(bochet, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = encorpado), (Aroma = natural), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.
atributos_tipo(braggot, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = leve), (Aroma = natural), (Carbonacao = espumante), (Docura = seco), (Teor = short),!.
atributos_tipo(melomel, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = encorpado), (Aroma = frutado), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.
atributos_tipo(metheglin, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = medio_encorpado), (Aroma = especiarias), (Carbonacao = still), (Docura = seco), (Teor = great),!.

% Tipos de carne branca
carne_branca(assada).
carne_branca(frita_molho).

% Tipos de carne intermediária
carne_intermediaria(porco).
carne_intermediaria(porco_agridoce).
carne_intermediaria(cervo).

% Tipos de carne vermelha
carne_vermelha(grelhada).
carne_vermelha(assada).
carne_vermelha(com_molho).

% Tipos de legumes
legume(saladas_secas).
legume(saladas_molho).
legume(frutas).

% Tipos de peixes
peixe(defumado).
peixe(frito_assado).
peixe(vapor).

% Tipos de sobremesas
sobremesa(quente).
sobremesa(fria).

% Tipos de pratos
prato(carne_branca).
prato(carne_intermediaria).
prato(carne_vermelha).
prato(peixe).
prato(sobremesa).
prato(legumes).

% REGRAS

%   Regra 1
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe no vapor
%     ENTÃO docura hidromel = Seco
%           corpo do hidromel = Leve
sugestao_hidromel(Hidromel, peixes, vapor) :-  melhor_hidromel(Hidromel_cod, leve , _ , _ , seco, _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 2
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe fritos ou assado
%     ENTÃO aroma hidromel = especiarias
%           corpo do hidromel = Medio Encorpado
sugestao_hidromel(Hidromel, peixes, frito_assado) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , especiarias , _ , _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 3
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe defumado
%     ENTÃO aroma hidromel = natural
%           corpo do hidromel = Medio Encorpado
sugestao_hidromel(Hidromel, peixes, defumado) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , natural , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 4
%     SE tipo prato = Legumes
%     E  Tipo Legume = Salada seca
%     ENTÃO docura hidromel = semiseco
%           corpo do hidromel = Medio Encorpado
sugestao_hidromel(Hidromel, legumes, saladas_secas) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _, semiseco , _  ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 5
%     SE tipo prato = Legumes
%     E  Tipo Legume = Salada com molho
%     ENTÃO Docura Hidromel = Seco
%           corpo do Hidromel = medio encorpado
sugestao_hidromel(Hidromel, legumes, saladas_molho) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , seco , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 5
%     SE tipo prato = Legumes
%     E  Tipo Legume = Frutas
%     ENTÃO  corpo do Hidromel = leve

sugestao_hidromel(Hidromel, legumes, frutas) :-  melhor_hidromel(Hidromel_cod, leve , _ , _ , _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 6
%     SE tipo prato = Carne branca
%     E  Tipo Carne Branca = assada
%     ENTÃO corpo Hidromel = medio encorpado
%           docura Hidromel - seco
sugestao_hidromel(Hidromel, carne_branca, assada) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , seco , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 7
%     SE tipo prato = Carne branca
%     E  Tipo Carne Branca = frita ou com molho
%     ENTÃO corpo Hidromel = medio encorpado
%           docura Hidromel = semiseco
sugestao_hidromel(Hidromel, carne_branca, frita_molho) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , semiseco , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 8
%     SE tipo prato = Carne intermediaria
%     E  Tipo Carne Intermediaria = porco
%     ENTÃO corpo Hidromel = medio encorpado
%           docura Hidromel = semiseco
sugestao_hidromel(Hidromel, carne_intermediaria, porco) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , semiseco , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 9
%     SE tipo prato = Carne intermediaria
%     E  Tipo Carne Intermediaria = porco agridoce
%     ENTÃO corpo Hidromel = encorpado
%           aroma Hidromel = frutado
sugestao_hidromel(Hidromel, carne_intermediaria, porco_agridoce) :-  melhor_hidromel(Hidromel_cod, encorpado , frutado , _ , _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 10
%     SE tipo prato = Carne intermediaria
%     E  Tipo Carne Intermediaria = cervo
%     ENTÃO corpo Hidromel = medio encorpado
%           docura Hidromel = seco
sugestao_hidromel(Hidromel, carne_intermediaria, cervo) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , seco , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 11
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = grellhada
%     ENTÃO corpo Hidromel = Encorpado
%           aroma do Hidromel = frutado
%           aroma do Hidromel = natural
sugestao_hidromel(Hidromel, carne_vermelha, grelhada) :-  melhor_hidromel(Hidromel_cod, encorpado , frutado , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).
sugestao_hidromel(Hidromel, carne_vermelha, grelhada) :-  melhor_hidromel(Hidromel_cod, encorpado , natural , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 12
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = com molho
%     ENTÃO corpo Hidromel = Encorpado
%           aroma do Hidromel = natural
sugestao_hidromel(Hidromel, carne_vermelha, com_molho) :- melhor_hidromel(Hidromel_cod, encorpado , natural , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 13
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = assada
%     ENTÃO corpo Hidromel = Encorpado
%           aroma do Hidromel = frutado
sugestao_hidromel(Hidromel, carne_vermelha, assada) :- melhor_hidromel(Hidromel_cod, encorpado , frutado , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 14
%     SE tipo prato = Sobremesas
%     E  Tipo Sobremesa = Quente
%     ENTÃO corpo Hidromel = Encorpado
%           aroma Hidromel = natural
sugestao_hidromel(Hidromel, sobremesa, quente) :-  melhor_hidromel(Hidromel_cod, encorpado , natural , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 14
%     SE tipo prato = Sobremesas
%     E  Tipo Sobremesa = Fria
%     ENTÃO corpo Hidromel = Leve
sugestao_hidromel(Hidromel, sobremesa, fria) :-  melhor_hidromel(Hidromel_cod, leve , _ , _, _ , _  ), nome_tipo(Hidromel_cod, Hidromel).


% CORPO AROMA CARBONACAO DOCURA TEOR_ALCOOL


melhor_hidromel(tradicional, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = medio_encorpado), (Aroma = natural), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.

melhor_hidromel(bochet, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = encorpado), (Aroma = natural), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.

melhor_hidromel(braggot, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = leve), (Aroma = natural), (Carbonacao = espumante), (Docura = seco), (Teor = short),!.

melhor_hidromel(melomel, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = encorpado), (Aroma = frutado), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.

melhor_hidromel(metheglin, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = medio_encorpado), (Aroma = especiarias), (Carbonacao = still), (Docura = seco), (Teor = great),!.

%%%%%%%%%%%%%% Sobre o Sistema %%%%%%%%%%%%%%

% Este é um sistema para recomendar um tipo de hidromel para comer com sua refeição.
% Devido a pouca literatura sobre o assunto e o consumo de hidromel ser pouco difundido,
% esse sistema especialista foi feito com, além das referências indicadas a seguir,
% a experiência do integrante Rafael Moresco Vieira, produtor de hidromel artesanal como hobby.
% Infelizmente, devido ao governo federal apenas reconhecer a produção de hidromel do estilo tradicional,
% o acesso aos outros tipos são mais difíceis.

%% Referencias:
% https://www.batchmead.com/blogs/batch/the-ultimate-guide-to-types-of-mead
% https://www.hiddenlegendwinery.com/what-food-goes-with-mead/
% https://www.vikingalchemist.com/mead-blog/2020/1/29/what-food-goes-well-with-mead
% https://www.arvenhidromeis.com.br/single-post/o-guia-definitivo-de-estilos-de-hidromel

%%%%%%%%%%%% Como usar o Sistema %%%%%%%%%%%%

% Para pedir uma recomendação de hidromel de acordo com seu prato de comida use o comando:
% sugestao_hidromel(hidromel, <SEU PRATO>, <SUBTIPO DO PRATO>).
% Para receber mais de uma recomendação (se houver) aperte o botão ";" para que o programa
% continue sugerindo. 

% Sendo que SEU PRATO pode ser: carne_branca, carne_intermediaria, carne_vermelha, peixe, sobremesa ou legumes.
% E para cada prato existe um subtipo.

% Para carne_branca existe os seguintes subtipos:
%  - assada
%  - frita_molho

% Para carne_intermediaria existe os seguintes subtipos:
%  - porco
%  - porco_agridoce
%  - cervo

% Para carne_vermelha existe os seguintes subtipos:
%  - grelhada
%  - assada
%  - com_molho

% Para legumes existe os seguintes subtipos:
%  - saladas_secas
%  - saladas_molho
%  - frutas

% Para peixe existe os seguintes subtipos:
%  - defumado
%  - frito_assado
%  - vapor

% Para sobremesa existe os seguintes subtipos:
%  - quente
%  - fria

% Exemplo de execução:
% Comando para pedir sugestão de hidromel ao comer carne de cervo:
sugestao_hidromel(Hidromel, carne_intermediaria, cervo).
% Output:
%   Hidromel = "Metheglin" ;
%   true.