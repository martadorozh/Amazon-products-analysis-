library(tidyverse)
library(httr)
library(rvest)

start_url <- "https://allegro.pl/kategoria/smartfony-i-telefony-komorkowe-apple-48978?bmatch=cl-e2101-d3859-c3683-ele-1-4-0429"

r <- httr::GET(
    start_url,
    user_agent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36"),
    add_headers(
        Referer = "https://allegro.pl/kategoria/"
    )
)

r


html_content <- content(r, "text") %>%
    read_html()

site_links <- html_content %>%
    html_nodes("a[class='block']") %>%
    html_attr("href")

    site_links
    

    site_links <- html_content %>%
    html_nodes("a[class='block']") %>%
    html_attr("href")

for (link in site_links) {
    r <- httr::GET(
        link,
        user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0"),
        add_headers(
            Referer = "https://www.uw.edu.pl/category/aktualnosci/"
        )
    )

html_content <- content(r, "text") %>%
        read_html() 

         title <- html_content %>%
        html_node(".title") %>%
        html_text() %>%
        trimws()

        print(title)

    break
}
