library(tidyverse)
library(tidytext)
library(RColorBrewer)
library(wordcloud)
library(Cairo)
library(textdata)
library(reshape2)

tweetscsr <- read.csv("./tweetscsr.csv", encoding = "UTF-8")

View(tweetscsr)

nrow(tentforbackk)

colnames(tentforbackk)

##tokenizacja 

tokens <- tentforbackk %>%
    unnest_tokens(token, Description)

nrow(tokens)
colnames(tokens)

View(tokens)


####kasowanie stopwords

get_stopwords()

tokens <- tokens %>%
    anti_join(
        get_stopwords(),
        by = c("token" = "word") # Niespójne nazwy kolumn, musi wiedzieć z czego usuwać
    )

nrow(tokens)
head(tokens, 20)


View(tokens)

###analiza
freq_tokens <- tokens %>%
    count(token, sort = TRUE) %>%
    head(n = 50)

freq_tokens

display.brewer.all() # Wszystkie dostępne palety
display.brewer.all(colorblindFriendly = TRUE)
display.brewer.pal(n = 10, name = "Paired") # Wyświetla wybraną paletę
brewer.pal(n = 10, name = "Paired") # Zwraca hexy

tokens %>%
    count(token) %>%
    with(
        wordcloud(
            token,
            n,
            max.words = 100,
            col = brewer.pal(n = 10, name = "Paired"),
            rot.per = 0.3,
            random.order = FALSE
        )
    )


get_sentiments()
get_sentiments("bing")
get_sentiments("afinn")
get_sentiments("loughran")


sentiments <- left_join(
    x = tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)

View(sentiments)

sentiments <- na.omit(sentiments)

1######

tokens %>%
   group_by(sentiment) %>%
   summarise(count = n()) %>%
   filter(count >= 25 | count <= -15) %>%
   mutate(Url = reorder(Url, count)) %>%
   ggplot(
       aes(
           x = "",
           y = count,
           fill = sentiment
        )
    ) +
   geom_col() +
   coord_flip() +
   theme(text = element_text(size = 14)) +
   scale_fill_gradient(
        low = "#ff0000",
        high = "#04a004"
   )


head(tokens, 5)




sentiments$sentiment <- replace_na(sentiments$sentiment, "neutral")

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

colnames(english_sentiments) <- c(
    "sentiment",
    "source",
    "score1",
    "score2",
    "score3",
    "so_pmi"
)
head(english_sentiments, 5)