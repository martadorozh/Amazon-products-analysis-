library(tidyverse)
library(tidytext)
library(RColorBrewer)
library(wordcloud)
library(Cairo)
library(textdata)
library(reshape2)

tweetscsr <- read.csv("./tweetscsr.csv", encoding = "UTF-8")



total <- merge(tentforbackk,tentforbest,by="Description")

nrow(total)

View(tweetscsr)


tokens <- total %>%
    unnest_tokens(token, Description)



get_stopwords()

tokens <- tokens %>%
    anti_join(
        get_stopwords(),
        by = c("token" = "word") 
    )       
sentiments <- na.omit(sentiments)
View(tokens)
#########good

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
            rot.per = 0.6,
            random.order = FALSE
        )
    )


ggplot(
    freq_tokens,
    aes(
        x = reorder(
            token,
            -n
        ),
        y = n,
        fill = colorRampPalette(
            brewer.pal(n = 9, name = "RdYlBu")
        )(nrow(freq_tokens))
    )
) +
geom_bar(stat = "identity") +
theme(
    text = element_text(size = 16),
    axis.text.x = element_text(
        angle = 90,
        vjust = 0.5,
        hjust = 1
    ),
    legend.position = "none"
)

#####sentiments
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



sentiments <- left_join(
    x = tokens,
    y = get_sentiments("afinn"),
    by = c("token" = "word")
)

sentiments <- na.omit(sentiments)

sentiment_chunks <- sentiments %>%
    group_by(
        chunk = (row_number() - 1) %/% (n() / 100)
    ) %>%
    summarise(avg = mean(value))
sentiment_chunks

sentiment_chunks <- sentiment_chunks %>%
    mutate(
        colour_group = ifelse(avg < -0.01, "negative", NA),
        colour_group = ifelse(avg > 0.01, "positive", colour_group),
        colour_group = ifelse(avg > -0.01 & avg < 0.01, "neutral", colour_group)
    )
sentiment_chunks

sentiment_chunks %>%
    ggplot(
        aes(
            chunk,
            avg,
            fill = colour_group
        )
    ) +
    geom_bar(stat = "identity", show.legend = FALSE) +
    scale_fill_manual(
        values = c(
            "negative" = "#b80101",
            "neutral" = "#f8cb00",
            "positive" = "#00b900"
        )
    )


sentiment_chunks %>%
    ggplot(
        aes(
            x = chunk,
            y = avg
        )
    ) +
    geom_point(
        aes(fill = avg),
        size = 5,
        color = "black",
        shape = 21
        ) +
    scale_fill_gradient2(low = "#bd0404", high = "#04a004", mid = "#fbff00")

###nie wyswietla sie prawidlowo
freq_tokens <- tokens %>%
    count(token, sort = TRUE)


freq_tokens <- left_join(
    x = freq_tokens,
    y = get_sentiments(),
    by = c("token" = "word")
)   

freq_tokens <- na.omit(freq_tokens)

freq_tokens %>%
    filter(n >= 2) %>%
    mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
    mutate(token = reorder(token, n)) %>%
    ggplot(aes(token, n, fill = sentiment)) +
    geom_col() +
    coord_flip()


####bardzomaloslow
freq_tokens %>%
    count(token, sentiment, sort = TRUE) %>%
    acast(token ~ sentiment, value.var = "n", fill = 0) %>%
    comparison.cloud(
        colors = c("#F8766D", "#00BFC4"),
        scale = c(2, 1.1)
    )	



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
        scale = c(5, 0.7)
    )



colnames(sentiments)

tokens <- left_join(
    x = tokens,
    y = select(
        sentiment,
        Url.x,
        value
    ),
    by = c("token" = "sentiment")
)

tokens <- na.omit(tokens)

head(tokens, 5)
#####nie dziala
tokens %>%
    group_by(Url.x) %>%
    summarise(count = n()) %>%
    mutate(Url.x = reorder(Url.x, sentiment)) %>%
    ggplot(aes(Url.x, sentiments, fill = sentiment)) +
    geom_col() +
    coord_flip() +
    theme(text = element_text(size = 14)) +
    scale_fill_gradient(
        low = "#ff0000",
        high = "#04a004"
    )