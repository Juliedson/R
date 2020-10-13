df <- read_csv("StudentsPerformance.csv")


# Fator

df$gender <- as.factor(df$gender)

df$`race/ethnicity` <- as.factor(df$`race/ethnicity`)

df$`parental level of education` <- as.factor(df$`parental level of education`)

df$lunch <- as.factor(df$lunch)

df$`test preparation course` <- as.factor(df$`test preparation course`)


# Nomear Colunas


colnames(df) <- c("gender", "race", "parental_level_education", "lunch", "preparation", "math_score", "reading_score", "writing_score")


# Retorna média de math_score por gênero.

df %>%
  group_by(gender) %>%
  summarise(okay = mean(math_score))

# Retorna valores únicos do reading score por gênero feminimo e lunch "standard"

df %>%
  group_by(gender = "female", lunch="standard") %>%
  summarize(contagem = length(unique(reading_score)))
  
  
