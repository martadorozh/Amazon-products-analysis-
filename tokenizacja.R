library(tidyverse)
library(tokenizers)
library(stopwords)

tentforbackk <- read.csv(
    "tentforbackk.csv",
    encoding = "UTF-8"
)

##
colnames(tentforbackk)

head(tentforbackk, 2)
##

View(tentforbackk)

######

tentforbackk$Description

tokenize_words(tentforbackk$Description)

stopwords("english")

stopwords_getsources()

stopwords(
    "english",
    source = "marimo"
)

tokens <- tokenize_words(
    tentforbackk$Description,
    stopwords = stopwords(
        "english",
        source = "marimo"
    )
)