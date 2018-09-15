#########################
# Bibliotecas Utilizadas
#########################

if( !require(ggplot2) )
  install.packages("ggplot2");

if !require(RColorBrewer) )
  install.packages("RColorBrewer");

library(ggplot2);
library(RColorBrewer);
  
#########################
# Preparação dos Dados
#########################
Cluster.Dados = Dados[,10:16];
View(Cluster.Dados);

#########################
# Cluster com Ward
#########################
Cluster.Distancias = dist(Cluster.Dados, method="euclidean");
Cluster.Hierarquia = hclust(Cluster.Distancias, method="ward.D2");

#########################
# 5 Grupos
#########################
plot(Cluster.Hierarquia);
rect.hclust(Cluster.Hierarquia, k=5, border="red");
Dados$C5 = factor(cutree(Cluster.Hierarquia, k=5));
aggregate(Dados[,10:16], list(Dados$C5), mean);

#########################
# 4 Grupos
#########################
plot(Cluster.Hierarquia);
rect.hclust(Cluster.Hierarquia, k=4, border="red");
Dados$C4 = factor(cutree(Cluster.Hierarquia, k=4));
aggregate(cbind(Dados[,10:16]), list(Dados$C4), mean);

#########################
# 3 Grupos
#########################
plot(Cluster.Hierarquia);
rect.hclust(Cluster.Hierarquia, k=3, border="red");
Dados$C3 = factor(cutree(Cluster.Hierarquia, k=3));
aggregate(cbind(Dados[,10:16]), list(Dados$C3), mean);

#########################
# K-Means
#########################
Cluster.Kmeans = kmeans(Cluster.Dados, 5);
Cluster.Kmeans;
Dados$K5 = factor(Cluster.Kmeans$cluster);

Cluster.Kmeans = kmeans(Cluster.Dados, 4);
Cluster.Kmeans;
Dados$K4 = factor(Cluster.Kmeans$cluster);

Cluster.Kmeans = kmeans(Cluster.Dados, 3);
Cluster.Kmeans;
Dados$K3 = factor(Cluster.Kmeans$cluster);

#########################
# Visualizações
#########################

# Listar paletas
display.brewer.all();

# Criar e manipular paleta
Cluster.Cores = brewer.pal(6, "Set1");

ggplot(Dados, aes(Geral, Auto, col=C5)) + geom_point();
ggplot(Dados, aes(Geral, Auto, col=K5)) + geom_point();

ggplot(Dados, aes(Geral, Auto, col=C4)) + geom_point();
ggplot(Dados, aes(Geral, Auto, col=K4)) + geom_point();

ggplot(Dados, aes(Geral, Auto, col=C3)) + geom_point();
ggplot(Dados, aes(Geral, Auto, col=K3)) + geom_point();


#############################
# Visualização Auto vs Demais
#############################

ggplot(Dados, aes(Assertividade, Auto, col=C4)) + geom_point();
ggplot(Dados, aes(Estrategias, Auto, col=C4)) + geom_point();
ggplot(Dados, aes(Usos, Auto, col=C4)) + geom_point();
ggplot(Dados, aes(Frequencia, Auto, col=C4)) + geom_point();
ggplot(Dados, aes(Importancia, Auto, col=C4)) + geom_point();

