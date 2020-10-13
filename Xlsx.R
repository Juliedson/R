library(tidyverse)

# Lê xlsx

c <- readxl::read_excel("Teste.xlsx")

# fitra por valores com Data = 2020/02/03 e plota gráfico de linha

c %>%
  filter(str_detect(Data, "2020-02-03")) %>%
   ggplot()+
   geom_line(aes(Vpg, 10 * Vpg))

# Retornando valores correspondentes

c[0:10, ,2]
