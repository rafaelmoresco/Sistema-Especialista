% Sistema recomendador de Hidromel
% Eduardo Borges Siqueira, 19100523
% Rafael Moresco Vieira, 19200435

tipo_Corpo(leve).
tipo_Corpo(medio_encorpado).
tipo_Corpo(encorpado).

tipo_Aroma(frutado).
tipo_Aroma(especiarias).
tipo_Aroma(natural).

tipo_Carbonacao(espumante).
tipo_Carbonacao(still).

tipo_Docura(seco).
tipo_Docura(semiseco).

tipo_TeorAlcool(short).
tipo_TeorAlcool(great).

nome_tipo(tradicional, "Tradicional").
nome_tipo(bochet, "Bochet").
nome_tipo(braggot, "Braggot").
nome_tipo(melomel, "Melomel").
nome_tipo(metheglin, "Metheglin").

/* nome_tipo(bb, "Bordeaux Blanc").
nome_tipo(sb, "Sauvignon Blanc").
nome_tipo(rs, "Riesling").
nome_tipo(rp, "Rosé de Provence").
nome_tipo(pn, "Pinot Noir").
nome_tipo(cn, "Chianti Novo").
nome_tipo(ch, "Chianti Reserva").
nome_tipo(cs, "Cabernet Sauvignon").
nome_tipo(mr, "Merlot").
nome_tipo(cr, "Champagne Rosé"). */

atributos_tipo(tradicional, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = medio_encorpado), (Aroma = natural), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.
atributos_tipo(bochet, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = encorpado), (Aroma = natural), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.
atributos_tipo(braggot, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = leve), (Aroma = natural), (Carbonacao = espumante), (Docura = seco), (Teor = short),!.
atributos_tipo(melomel, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = encorpado), (Aroma = frutado), (Carbonacao = still), (Docura = semiseco), (Teor = great),!.
atributos_tipo(metheglin, Corpo, Aroma, Carbonacao, Docura, Teor) :- (Corpo = medio_encorpado), (Aroma = especiarias), (Carbonacao = still), (Docura = seco), (Teor = great),!.

/* atributos_vinho(bb, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = branco), (Tipo = seco), (Corpo = leve), (Acidez = media), (Aroma = nao_frutado),!.
atributos_vinho(sb, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = branco), (Tipo = seco), (Corpo = leve), (Acidez = alta), (Aroma = nao_frutado), !.
atributos_vinho(rs, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = branco), (Tipo = demi_seco), (Corpo = leve), (Acidez = baixa), (Aroma = frutado), !.
atributos_vinho(rp, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = rose), (Tipo = demi_seco), (Corpo = leve), (Acidez = baixa), (Aroma = frutado), !.
atributos_vinho(pn, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = tinto), (Tipo = seco), (Corpo = encorpado), (Acidez = media), (Aroma = nao_frutado), !.
atributos_vinho(cn, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = tinto), (Tipo = seco), (Corpo = medio_encorpado), (Acidez = media), (Aroma = nao_frutado), !.
atributos_vinho(ch, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = tinto), (Tipo = seco), (Corpo = encorpado), (Acidez = baixa), (Aroma = nao_frutado), !.
atributos_vinho(cs, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = tinto), (Tipo = seco), (Corpo = encorpado), (Acidez = alta), (Aroma = nao_frutado), !.
atributos_vinho(mr, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = tinto), (Tipo = seco), (Corpo = medio_encorpado), (Acidez = media), (Aroma = nao_frutado), !.
atributos_vinho(cr, Cor, Tipo, Corpo, Acidez, Aroma) :- (Cor = rose), (Tipo = seco), (Corpo = leve), (Acidez = baixa), (Aroma = frutado), !. */


carne_branca(assada).
carne_branca(frita_molho).

carne_intermediaria(porco).
carne_intermediaria(cervo).

carne_vermelha(grelhada).
carne_vermelha(assada).
carne_vermelha(com_molho).

legume(saladas_secas).
legume(saladas_molho).
legume(frutas).

peixe(defumado).
peixe(frito_assado).
peixe(vapor).

sobremesa(quente).
sobremesa(fria).

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
%     ENTÃO cor vinho = Branco CNF 100%
%           tipo vinho = Seco CNF 100%
%           corpo do vinho = leve CNF 100%
sugestao_hidromel(Hidromel, peixes, vapor) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , semiseco, _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 2
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe fritos ou grelhado
%     ENTÃO aroma vinho = frutado CNF 100%
%           cor vinho = Rosé CNF 100%
%           acidez do vinho = pouco ácido CNF 100%
sugestao_hidromel(Hidromel, peixes, frito_assado) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , seco , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 3
%     SE tipo prato = Peixes e frutos do Mar
%     E  Tipo Peixe = Peixe defumado
%     ENTÃO tipo Hidromel = Seco CNF 100%
%           cor Hidromel = Branco CNF 100%
%           acidez do Hidromel = ácido  CNF 100%
sugestao_hidromel(Hidromel, peixe, defumado) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , especiarias , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 4
%     SE tipo prato = Legumes
%     E  Tipo Legume = Acompanha molho delicado
%     ENTÃO cor Hidromel = Branco CNF 100%
%           aroma Hidromel = frutado CNF 100%
%           acidez do Hidromel = pouco ácido CNF 100%
sugestao_hidromel(Hidromel, legumes, saladas_secas) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _, semiseco , _  ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 5
%     SE tipo prato = Legumes
%     E  Tipo Legume = beringela ou abobrinha
%     ENTÃO cor Hidromel = Tinto CNF 100%
%           tipo Hidromel = Seco CNF 100%
%           corpo do Hidromel = encorpado CNF 100%
sugestao_hidromel(Hidromel, legumes, saladas_molho) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , seco , _ ), nome_tipo(Hidromel_cod, Hidromel).

sugestao_hidromel(Hidromel, legumes, frutas) :-  melhor_hidromel(Hidromel_cod, leve , _ , _ , _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 9
%     SE tipo prato = Carne branca
%     E  Tipo Carne Branca = Porco
%     OU Tipo Carne Branca = Aves
%     ENTÃO cor Hidromel = Branco CNF 60%
%           cor Hidromel = Tinto CNF 100%
%           acidez do Hidromel = médio ácido CNF 100%
sugestao_hidromel(Hidromel, carne_branca, assada) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , seco , _ ), nome_tipo(Hidromel_cod, Hidromel).


sugestao_hidromel(Hidromel, carne_branca, frita_molho) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , frutado , _ , _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

sugestao_hidromel(Hidromel, carne_intermediaria, porco) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , semiseco , _ ), nome_tipo(Hidromel_cod, Hidromel).
sugestao_hidromel(Hidromel, carne_intermediaria, porco) :-  melhor_hidromel(Hidromel_cod, encorpado , frutado , _ , semiseco , _ ), nome_tipo(Hidromel_cod, Hidromel).
sugestao_hidromel(Hidromel, carne_intermediaria, cervo) :-  melhor_hidromel(Hidromel_cod, medio_encorpado , _ , _ , seco , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 10
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = grellhada
%     ENTÃO cor Hidromel = Tinto CNF 100%
%           acidez do Hidromel = médio ácido CNF 100%
sugestao_hidromel(Hidromel, carne_vermelha, grelhada) :-  melhor_hidromel(Hidromel_cod, encorpado , frutado , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).
sugestao_hidromel(Hidromel, carne_vermelha, grelhada) :-  melhor_hidromel(Hidromel_cod, encorpado , natural , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 11
%     SE tipo prato = Carne vermelha
%     E  Tipo Carne Vermelha = com molho
%     OU Tipo Carne Vermelha = assada
%     ENTÃO tipo Hidromel = Seco CNF 100%
%           cor Hidromel = Tinto CNF 100%
%           corpo do Hidromel = encorpado CNF 100%
sugestao_hidromel(Hidromel, carne_vermelha, com_molho) :- melhor_hidromel(Hidromel_cod, encorpado , natural , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).
sugestao_hidromel(Hidromel, carne_vermelha, assada) :- melhor_hidromel(Hidromel_cod, encorpado , frutado , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

%   Regra 12
%     SE tipo prato = Sobremesas
%     E  Tipo Sobremesa = Frutas
%     ENTÃO cor Hidromel = Branco CNF 100%
%           cor Hidromel = Rosé CNF 80%
%           aroma Hidromel = frutado CNF 100%
sugestao_hidromel(Hidromel, sobremesa, quente) :-  melhor_hidromel(Hidromel_cod, encorpado , natural , _, _ , _ ), nome_tipo(Hidromel_cod, Hidromel).

sugestao_hidromel(Hidromel, sobremesa, fria) :-  melhor_hidromel(Hidromel_cod, leve , _ , _, _ , _  ), nome_tipo(Hidromel_cod, Hidromel).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                      %%    
%%    %%   %%    %%%%%%%%    %%%%%%%    %%
%%    %%   %%    %%          %%   %%    %%
%%    %%   %%    %%%%%%%%    %%   %%    %%
%%    %%   %%          %%    %%   %%    %%
%%    %%%%%%%    %%%%%%%%    %%%%%%%    %%
%%                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Para pedir uma recomendação de vinho de acordo com seu prato de comida use o comando:
% sugestao_vinho(Vinho, <SEU PRATO>, <SUBTIPO DO PRATO>).
% Para receber mais de uma recomendação (se houver) aperte o botão ";" para que o programa
% continue sugerindo. 

% Sendo que SEU PRATO pode ser: carne_branca, carne_vermelha, peixe, massa, sobremesa ou legumes.
% E para cada prato existe um subtipo.

% Para carne_branca existe os seguintes subtipos:
%  - porco
%  - aves

% Para carne_vermelha existe os seguintes subtipos:
%  - grelhada
%  - assada
%  - com_molho

% Para peixe existe os seguintes subtipos:
%  - defumado
%  - frito_assado
%  - vapor

% Para massa existe os seguintes subtipos:
%  - aglio_olio
%  - mais_gorduroso
%  - tomato

% Para sobremesa existe os seguintes subtipos:
%  - fruta
%  - chocolate

% Para legumes existe os seguintes subtipos:
%  - beringela_abobrinha
%  - molho_delicado



% Exemplo de execução:
% Comando para pedir sugestão de vinho ao comer massa com molho de tomate:
sugestao_hidromel(Hidromel, carne_intermediaria, cervo).
% Output:
%   Vinho = "Merlot" ;
%   true.