library(tidyverse)
library(tidytext)
library(RColorBrewer)
library(wordcloud)
library(Cairo)
library(textdata)
library(reshape2)

tentforbackk <- read.csv("./tentforbackk.csv", encoding = "UTF-8")

tentforback2 <- read.csv("./tentforback2.csv", encoding = "UTF-8")

total <- merge(tentforbackk,tentforback2,by="Description")

View(total)


########tokenizacja
tokens <- tentforback2 %>%
    unnest_tokens(token, Description)


######### Kasowanie stopwords 
get_stopwords()

tokens <- tokens %>%
    anti_join(
        get_stopwords(),
        by = c("token" = "word") 
    )
	
View(tokens)


########analiza
get_sentiments()
get_sentiments("bing")
get_sentiments("afinn")
get_sentiments("loughran")


sentiments <- left_join(
    x = tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)

sentiments <- na.omit(sentiments)

View(sentiments)

sentiments %>%
    group_by(sentiment) %>%
    summarise(count = n()) %>%
    ggplot(
        aes(
            x = "",
            y = count,
            fill = sentiment
        )
    ) +
      geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0) +
    scale_fill_manual(
        values = c(
            "positive" = "#04a004",
            "negative" = "#bd0404",
            "neutral" = "#a5a5a5"
        )
    )


########Generujemy jeszcze raz najczęstsze tokeny, teraz bez ograniczenia ilości
freq_tokens <- tokens %>%
    count(token, sort = TRUE)

freq_tokens <- left_join(
    x = freq_tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)
freq_tokens <- na.omit(freq_tokens)

freq_tokens %>%
    mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
    mutate(token = reorder(token, n)) %>%
    ggplot(aes(token, n, fill = sentiment)) +
    geom_col() +
    coord_flip()

######Rysujemy podzieloną chmurę tagów

freq_tokens %>%
    count(token, sentiment, sort = TRUE) %>%
    acast(token ~ sentiment, value.var = "n", fill = 0) %>%
    comparison.cloud(
        colors = c("#F8766D", "#00BFC4"),
        scale = c(5, 0.7)
    )							  		      
