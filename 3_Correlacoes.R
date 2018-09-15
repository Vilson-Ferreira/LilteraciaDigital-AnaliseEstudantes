#########################
# Bibliotecas Utilizadas
#########################
if( !require(GGally) )
  install.packages("GGally");

library(GGally);

########################
# Matrizes e Correlações
########################

# Totas as variáveis
ggpairs(data=Dados, columns=10:16, title="Literacia");
ggcorr(data=Dados[,10:16], label=TRUE);

########################
# Scatterplots
########################

ggplot(Dados, aes(Geral, Auto)) + geom_point() + geom_smooth(method="lm", se=FALSE);
ggplot(Dados, aes(Geral, Auto, col=Polo)) + geom_point();
ggplot(Dados, aes(Geral, Auto)) + geom_point() + geom_smooth(method="lm", se=FALSE) + facet_grid(.~Perfil);
ggplot(Dados, aes(Geral, Auto)) + geom_point() + geom_smooth(method="lm", se=FALSE) + facet_grid(.~Polo);

########################
# Regressão e Resíduos
########################

Modelo = lm(Auto ~ Assertividade + Estrategias + Usos + Frequencia + Importancia + Geral, data=Dados);
summary(Modelo);
Modelo.ResiduosPadronizados = scale(Modelo$residuals);

ggplot(Modelo, aes(Modelo$residuals)) + geom_histogram(col="black", fill="blue", alpha=0.4);
ggplot(Dados, aes(Auto, Modelo$residuals)) + geom_point();
ggplot(Dados, aes(Auto, Modelo.ResiduosPadronizados)) + geom_point();

##########################################################################
# Regressão com Auto - Geral, devido cenários altos em erros padrões e Pr.
##########################################################################

Modelo = lm(Auto ~ Assertividade + Estrategias + Usos + Frequencia + Importancia, data=Dados);
summary(Modelo);
Modelo.ResiduosPadronizados = scale(Modelo$residuals);

ggplot(Modelo, aes(Modelo$residuals)) + geom_histogram(col="black", fill="blue", alpha=0.4);
ggplot(Dados, aes(Auto, Modelo$residuals)) + geom_point();
ggplot(Dados, aes(Auto, Modelo.ResiduosPadronizados)) + geom_point();

#######################################################################
# Regressão com Geral - Auto, por cenários altos em erros padrões e Pr.
#######################################################################

Modelo = lm(Geral ~ Assertividade + Estrategias + Usos + Frequencia + Importancia, data=Dados);
summary(Modelo);
Modelo.ResiduosPadronizados = scale(Modelo$residuals);

ggplot(Modelo, aes(Modelo$residuals)) + geom_histogram(col="black", fill="blue", alpha=0.4);
ggplot(Dados, aes(Geral, Modelo$residuals)) + geom_point();
ggplot(Dados, aes(Geral, Modelo.ResiduosPadronizados)) + geom_point();
