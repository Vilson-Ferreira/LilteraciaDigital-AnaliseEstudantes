#########################
# Bibliotecas Utilizadas
#########################
if( !require(psych) )
  install.packages("psych");

if( !require(ggplot2) )
  install.packages("ggplot2");

if( !require(GGally) )
  install.packages("GGally");

library(psych);
library(ggplot2);
library(GGally);

#########################
# Preparação dos Dados
#########################
PC.Dados = Dados[,10:14];
View(PC.Dados);

#########################
# Correlações
#########################
ggpairs(data=PC.Dados, columns=1:5, title="Literacia");
PC.MatrizCorrelacoes = cor(PC.Dados);

#########################
# Fatores
#########################
PC.Fatores = principal(PC.MatrizCorrelacoes, nfactors=2, rotate="varimax", scores=TRUE);
summary(PC.Fatores);
PC.Fatores;

#########################
# Matrizes de Componentes
#########################
PC.Scores = factor.scores(PC.Dados, PC.Fatores, method="Thurstone");
PC.Fatores.Scores = as.data.frame(PC.Scores$weights);
PC.Dados.Scores = as.data.frame(PC.Scores$scores);

# > PC1: Estrategias + Usos + Frequencia
# > PC2: Assertividade + Importancia

#########################
# Scatterplot dos Fatores
#########################
Dados$PC1 = PC.Dados.Scores$RC1;
Dados$PC2 = PC.Dados.Scores$RC2;

ggplot(Dados, aes(PC1, PC2, col=Auto)) + geom_point();
ggplot(Dados, aes(PC1, PC2, col=Geral)) + geom_point();
ggplot(Dados, aes(PC1, PC2, col=Geral)) + geom_point() + geom_vline(xintercept=0, size=2, alpha=0.4) + geom_hline(yintercept=0, size=2, alpha=0.4);


################################
# Cluster Hierarquico - 5 grupos
################################
Cluster.Dados = cbind(Dados$PC1, Dados$PC2);
Cluster.Distancias = dist(Cluster.Dados, method="euclidean");
Cluster.Hierarquia = hclust(Cluster.Distancias, method="ward.D2");

plot(Cluster.Hierarquia);
rect.hclust(Cluster.Hierarquia, k=5, border="red");
Dados$ClusterPCH = factor(cutree(Cluster.Hierarquia, k=5));
aggregate(Dados[,10:16], list(Dados$ClusterPCH), mean);

ggplot(Dados, aes(PC1, PC2, col=ClusterPCH)) + geom_point() + geom_vline(xintercept=0, size=2, alpha=0.4) + geom_hline(yintercept=0, size=2, alpha=0.4);

################################
# Cluster Kmeans - 5 grupos
################################
Cluster.Kmeans = kmeans(Cluster.Dados, 5);
Dados$ClusterPCK = factor(Cluster.Kmeans$cluster);

ggplot(Dados, aes(PC1, PC2, col=ClusterPCK)) + geom_point() + geom_vline(xintercept=0, size=2, alpha=0.4) + geom_hline(yintercept=0, size=2, alpha=0.4);

