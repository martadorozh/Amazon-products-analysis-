library(tidyverse)
library(httr)
library(rvest)

# Piszemy funkcję, która będzie przyjmowała obiekt z treścią HTML
# oraz DataFrame z artykułami, do którego będzie dopisywała nowe artykuły.
scrap_articles <- function(subpage_n, articles) {
    # Łączymy sobie numerek strony z URLem
    # Tworzymy też referer będący poprzednią stroną z kolei
    subpage_url <- paste("https://www.uw.edu.pl/category/aktualnosci/page/", subpage_n, sep = "")
    referer <- paste("https://www.uw.edu.pl/category/aktualnosci/page/", subpage_n - 1, sep = "")

    # Pobieramy stronę
    r <- httr::GET(
        subpage_url,
        user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0"),
        add_headers(
            Referer = referer
        )
    )
    # Tworzymy obiekt HTML z treścią
    html_content <- content(r, "text") %>%
        read_html()
    # Wyszukujemy wszystkie linki na stronie
    site_links <- html_content %>%
        html_nodes("a[class='block']") %>%
        html_attr("href")

    for (link in site_links) {
        # Pobieramy treść strony
        r <- httr::GET(
            link,
            user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0"),
            add_headers(
                Referer = subpage_url
            )
        )
        # Czytamy kod HTML
        html_content <- content(r, "text") %>%
            read_html()

        # Wybieramy tytuł selektorem CSS
        title <- html_content %>%
            html_node(".title") %>%
            html_text() %>%
            trimws()
            # Mozna użyć gsub() do usuwania niechcianych elementów
            # gsub("\\s+", " ", .)

        # Analogicznie wybieramy treść artykułu
        body <- html_content %>%
            html_node(".article-text") %>%
            html_nodes("p,h5") %>%
            html_text() %>%
            paste(collapse = " ") %>%
            gsub("\\s+", " ", .)

        # Wybieramy datę i wykorzystując wyrażenie regularne
        # w funkcji str_extract() z biblioteki Tidyverse
        # wyciągamy datę w formacie [dzień] [miesiąca] [rok]
        date <- html_content %>%
            html_node(".t_a-right") %>%
            html_text() %>%
            stringr::str_extract("(?<=Data\\spublikacji:\\s).*[0-9]")

        # Wyciągamy miesiąc z daty w formie tekstowej
        month <- stringr::str_extract(date, "[a-zA-Z]+")
        # Dopasowujemy wyciągnięty miesiąc do odpowiadającego mu numerka
        # i zamieniamy postać tekstową na liczbę
        date <- switch(
            month,
            "stycznia" = gsub("\\s.*\\s", ".01.", date),
            "lutego" = gsub("\\s.*\\s", ".02.", date),
            "marca" = gsub("\\s.*\\s", ".03.", date),
            "kwietnia" = gsub("\\s.*\\s", ".04.", date),
            "maja" = gsub("\\s.*\\s", ".05.", date),
            "czerwca" = gsub("\\s.*\\s", ".06.", date),
            "lipca" = gsub("\\s.*\\s", ".07.", date),
            "sierpnia" = gsub("\\s.*\\s", ".08.", date),
            "września" = gsub("\\s.*\\s", ".09.", date),
            "października" = gsub("\\s.*\\s", ".10.", date),
            "listopada" = gsub("\\s.*\\s", ".11.", date),
            "grudnia" = gsub("\\s.*\\s", ".12.", date)
        )
        # Zamieniamy datę w formie ciągu tekstowego na datę w formie obiektu daty
        date <- as.Date(date, "%d.%m.%Y")

        # Dodajemy komplet pozyskanych danych do naszego DataFrame'a
        articles <- articles %>% add_row(
            "Title" = title,
            "Body" = body,
            "Date" = date
        )
        # Czysto opcjonalne, gdybyśmy zostali zablokowani
        # Poniższa funkcja czeka między 1 a 15 sekund
        # przed przejściem do następnej iteracji pętli.
        Sys.sleep(
            runif(1, 1, 15)
        )
    }
    # Zwracamy articles z dodanymi nowymi artykułami
    return(articles)
}

# Link od którego zaczynamy
start_url <- "https://www.uw.edu.pl/category/aktualnosci/"

# Pobieramy zawartość strony startowej
r <- httr::GET(
    start_url,
    user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0"),
    add_headers(
        Referer = "https://www.uw.edu.pl/"
    )
)

# Tworzymy obiekt z zawartością HTML
html_content <- content(r, "text") %>%
    read_html()

# Sprawdzamy maksymalną liczbę stron
sites_number <- html_content %>%
    html_node("a.page-numbers:nth-child(7) > span:nth-child(1)") %>%
    html_text()

# Tworzymy pusty DataFrame na artykuły
articles <- data.frame(
    "Title" = character(),
    "Body" = character(),
    "Date" = as.Date(character())
)

# Robimy pętlę, by napisana wcześniej funkcja zescrapowała
# każdą z istniejących stron
for (subpage_n in 1:sites_number) {
    # Dodajemy do DF articles kolejne artykuły za pomocą funkcji scrap_articles()
    articles <- scrap_articles(subpage_n, articles)
    print(
        paste(
            "Pobrano stronę nr",
            subpage_n
        )
    )
}

# Na koniec zapisujemy naszego Data Frame'a do pliku CSV
write.csv(
    articles,
    "./articles.csv",
    fileEncoding = "UTF-8",
    row.names = FALSE
)


print('Done')
