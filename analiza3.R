library(tidyverse)
library(tidytext)
library(RColorBrewer)
library(wordcloud)
library(Cairo)
library(textdata)
library(reshape2)

tentforbackk <- read.csv("./tentforbackk.csv", encoding = "UTF-8")

View(tentforbackk)

tokens <- tentforbackk %>%
    unnest_tokens(token, Description)

get_stopwords()

tokens <- tokens %>%
    anti_join(
        get_stopwords(),
        by = c("token" = "word") 
    )    


View(tokens)

sentiments <- left_join(
    x = tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)

sentiments <- na.omit(sentiments)

View(sentiments)

freq_tokens <- tokens %>%
    count(token, sort = TRUE) %>%
    head(n = 50)

freq_tokens

freq_tokens <- tokens %>%
    count(token, sort = TRUE)

sentiments <- left_join(
    x = freq_tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)

sentiments$sentiment <- replace_na(sentiments$sentiment, "neutral")

sentiments %>%
    filter(n >= 10) %>%
    mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
    mutate(token = reorder(token, n)) %>%
    ggplot(aes(token, n, fill = sentiment)) +
    geom_col() +
    coord_flip() +
    scale_fill_manual(
        values = c(
            "positive" = "#04a004",
            "negative" = "#bd0404",
            "neutral" = "#a5a5a5"
        )
    )

########
library(reshape2)

sentiments <- left_join(
    x = tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)

sentiments <- na.omit(sentiments)

sentiments %>%
    count(token, sentiment, sort = TRUE) %>%
    acast(token ~ sentiment, value.var = "n", fill = 0) %>%
    comparison.cloud(
        colors = c("#F8766D", "#00BFC4"),
        scale = c(5, 0.2)
    )
get_sentiments()
####2
sentiments <- left_join(
    x = tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)  

sentiments <- na.omit(sentiments)

sentiments %>%
    group_by(Description) %>%
    summarise(count = n()) %>%
    mutate(Description = reorder(Description, sentiment)) %>%
    ggplot(aes(Description, sentiment, fill = sentiment)) +
    geom_col() +
    coord_flip() +
    theme(text = element_text(size = 14)) +
    scale_fill_gradient(
        low = "#ff0000",
        high = "#04a004"
    )


    