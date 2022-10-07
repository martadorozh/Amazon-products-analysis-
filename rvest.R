library(dplyr)
library(httr)
library(rvest)

url <- "https://app.scrapingbee.com/api/v1/"

r <- httr::GET(
    url = url,
    user_agent("W4FDY4DZCVIJG4AE7SBEPNOOP0IV3Y9B209A7A3YI2XUOXJVUUOQMCWNC9BYBIWHPVF7FPI0X7SQT7Z7"),
    add_headers(
        Referer = "http://logistykamediow.pl/site/"
    )
)



response_text <- content(r, "text")
#Ładujemy zawartość strony do obiektu HTML
html_content <- read_html(response_text, encoding = "UTF-8")
html_content


title <- html_content %>%
    html_node(css = ".entry-header > h1:nth-child(1)")

    title

    title %>% html_text()

#rozne sposoby
    title <- html_content %>%
    html_node(css = ".entry-header > h1:nth-child(1)") %>%
    html_text()

title

title <- html_content %>%
    html_node(xpath = "/html/body/div[1]/div[2]/div[1]/div[1]/div/article/header/h1") %>%
    html_text()

title

title <- html_content %>%
    html_node("[class='entry-title']") %>%
    html_text()

title

article_body <- html_content %>%
    html_node("p") %>%
    html_text()

article_body

article_body <- html_content %>%
    html_nodes("p") %>%
    html_text()

article_body

article_body <- html_content %>%
    html_node("div[class='entry-content']") %>%
    html_nodes("p") %>%
    html_text()

article_body

article_body <- paste(article_body, collapse = " ")

article_body

przydatne_linki <- html_content %>%
    html_node("ul[id='menu-przydatne-linki']") %>%
    html_nodes("li")

przydatne_linki

list_elements <- przydatne_linki %>%
    html_text()

list_elements

list_links <- przydatne_linki %>%
    html_nodes("a") %>%
    html_attr("href")

list_links

for (idx in seq_len(length(list_elements))) {
    print(paste(
        list_elements[idx],
        "->",
        list_links[idx]
    ))
}