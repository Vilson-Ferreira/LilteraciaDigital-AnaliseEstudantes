
#########################
# Carga de Dados
#########################
Dados = read.csv("Literacia_Resultados.csv", sep=";", dec=".");
View(Dados);
names(Dados) = c("Id", "Nome", "Email", "Perfil", "CriacaoId", "MoodleId", "Polo", "Data", "Itens", "Assertividade", "Estrategias", "Usos", "Frequencia", "Importancia" , "Geral", "Auto");

#########################
# Categóricas
#########################

Dados$Perfil = factor(Dados$Perfil);
Dados$Polo = factor(Dados$Polo);

#########################
# Quantis
#########################
Dados.Quantis = data.frame(Quantil=seq(0, 1, by=0.1));
Dados.Quantis$Assertividade = quantile(Dados$Assertividade, seq(0, 1, by=0.1));
Dados.Quantis$Estrategias = quantile(Dados$Estrategias, seq(0, 1, by=0.1));
Dados.Quantis$Usos = quantile(Dados$Usos, seq(0, 1, by=0.1));
Dados.Quantis$Frequencia = quantile(Dados$Frequencia, seq(0, 1, by=0.1));
Dados.Quantis$Importancia = quantile(Dados$Importancia, seq(0, 1, by=0.1));
Dados.Quantis$Geral = quantile(Dados$Geral, seq(0, 1, by=0.1));
Dados.Quantis$Auto = quantile(Dados$Auto, seq(0, 1, by=0.1));

View(Dados.Quantis);


rm(list=ls());