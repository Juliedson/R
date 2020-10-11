# carrega library do tidyverse

library(tidyverse)

atletas <- read_csv("Atletas.csv")

clubes <- read_csv("Clubes.csv")

posicao <- left_join(atletas, clubes, c("atleta_id" = "id"))


# encontra não repetidos:

posicao <- as_factor(posicao$atleta_id)

# filtro por valores, maior ou igual a 79000, por exemplo:

filtra <- filter(posicao, posicao$atleta_id >= 79000)

# média entre valores:

df2 <- atletas %>%
     summarise(media_pontos = mean(atleta_id))

# plot pra análise

plot(atletas)
