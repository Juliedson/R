library(tidyverse)

atletas <- read_csv("2016_atletas2.csv")

scouts <- read_csv("2016_scouts2.csv")

posicao <- scouts %>%
      filter(participou == TRUE & rodada <= 5 & rodada > 0) %>%
      left_join(atletas, c("atleta_id" = "id"))

## Nomeando valores de tabela filtrada ##

posicao$posicao_id <- factor(posicao$posicao_id,
       levels = c(1:6),
       labels = c("goleiro","lateral","zagueiro","meia","atacante","técnico"))
       
## resultado


posicao$posicao_id 


## análise gráfica de pontos por rodada individual ##

posicao %>%
    ggplot(aes(pontos_num)) + 
    geom_density()+
    facet_wrap(.~posicao_id)


posicao %>%
    ggplot(aes(pontos_num)) + 
    geom_density()+
    facet_wrap(rodada~posicao_id)


### análise linear de gráfico de linha ###


rodada_38 <- scouts %>%
    filter(rodada == 38)
rodada_38 %>%
    ggplot(mapping = aes(x = media_num, y = preco_num))+
    geom_line()+
    geom_smooth(method = lm)
    

### análise linear de gráfico com pontos ###
   
   rodada_38 %>%
    ggplot(mapping = aes(x = media_num, y = preco_num))+
    geom_point()+
    geom_smooth(method = lm)
