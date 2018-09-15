#########################
# Bibliotecas Utilizadas
#########################
if( !require(ggplot2) )
  install.packages("ggplot2");

library(ggplot2);

#########################
# Análise Exploratória
#########################
ggplot(Dados, aes(x=Auto)) + geom_histogram(col="black", fill="blue", alpha=0.4, bins=20);
ggplot(Dados, aes(x="", y=Auto)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados.Quantis, aes(x=Quantil, y=Auto)) + geom_point(size=4) + geom_line(size=2) + scale_x_continuous(breaks=seq(0,1,by=0.1));
ggplot(Dados, aes(x=Polo, y=Auto)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados, aes(x=Perfil, y=Auto)) + geom_boxplot(fill="gray", outlier.color="red");

ggplot(Dados, aes(x=Geral)) + geom_histogram(col="black", fill="blue", alpha=0.4, bins=20);
ggplot(Dados, aes(x="", y=Geral)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados.Quantis, aes(x=Quantil, y=Geral)) + geom_point(size=4) + geom_line(size=2) + scale_x_continuous(breaks=seq(0,1,by=0.1));
ggplot(Dados, aes(x=Polo, y=Geral)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados, aes(x=Perfil, y=Geral)) + geom_boxplot(fill="gray", outlier.color="red");

ggplot(Dados, aes(x=Assertividade)) + geom_histogram(col="black", fill="blue", alpha=0.4, bins=20);
ggplot(Dados, aes(x="", y=Assertividade)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados.Quantis, aes(x=Quantil, y=Assertividade)) + geom_point(size=4) + geom_line(size=2) + scale_x_continuous(breaks=seq(0,1,by=0.1));
ggplot(Dados, aes(x=Polo, y=Assertividade)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados, aes(x=Perfil, y=Assertividade)) + geom_boxplot(fill="gray", outlier.color="red");

ggplot(Dados, aes(x=Estrategias)) + geom_histogram(col="black", fill="blue", alpha=0.4, bins=20);
ggplot(Dados, aes(x="", y=Estrategias)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados.Quantis, aes(x=Quantil, y=Estrategias)) + geom_point(size=4) + geom_line(size=2) + scale_x_continuous(breaks=seq(0,1,by=0.1));
ggplot(Dados, aes(x=Polo, y=Estrategias)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados, aes(x=Perfil, y=Estrategias)) + geom_boxplot(fill="gray", outlier.color="red");

ggplot(Dados, aes(x=Usos)) + geom_histogram(col="black", fill="blue", alpha=0.4, bins=20);
ggplot(Dados, aes(x="", y=Usos)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados.Quantis, aes(x=Quantil, y=Usos)) + geom_point(size=4) + geom_line(size=2) + scale_x_continuous(breaks=seq(0,1,by=0.1));
ggplot(Dados, aes(x=Polo, y=Usos)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados, aes(x=Perfil, y=Usos)) + geom_boxplot(fill="gray", outlier.color="red");

ggplot(Dados, aes(x=Frequencia)) + geom_histogram(col="black", fill="blue", alpha=0.4, bins=20);
ggplot(Dados, aes(x="", y=Frequencia)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados.Quantis, aes(x=Quantil, y=Frequencia)) + geom_point(size=4) + geom_line(size=2) + scale_x_continuous(breaks=seq(0,1,by=0.1));
ggplot(Dados, aes(x=Polo, y=Frequencia)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados, aes(x=Perfil, y=Frequencia)) + geom_boxplot(fill="gray", outlier.color="red");

ggplot(Dados, aes(x=Importancia)) + geom_histogram(col="black", fill="blue", alpha=0.4, bins=20);
ggplot(Dados, aes(x="", y=Importancia)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados.Quantis, aes(x=Quantil, y=Importancia)) + geom_point(size=4) + geom_line(size=2) + scale_x_continuous(breaks=seq(0,1,by=0.1));
ggplot(Dados, aes(x=Polo, y=Importancia)) + geom_boxplot(fill="gray", outlier.color="red");
ggplot(Dados, aes(x=Perfil, y=Importancia)) + geom_boxplot(fill="gray", outlier.color="red");

