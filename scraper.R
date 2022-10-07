library(tidyverse)
library(httr)
library(rvest)


url <- "https://www.ebay.pl"

r <- httr::GET(
    url,
    path = "/get"
)

r

http_status(r)

r$status_code

r$headers

r$headers$"Content-Type"

content(r, "text")

content(r, "text", encoding = "UTF-8")

library("rjson")

content_as_json <- fromJSON(
    content(r, "text", encoding = "UTF-8")
)

content_as_json

writeLines(
    content(r, "text"),
    "response_text.json"
)

content(r, "raw")

writeBin(
    content(r, "raw"),
    "response_raw.json"
)

r <- httr::GET(
    url,
    path = "/html"
)
r$headers$"Content-Type"
#XML
r <- httr::GET(
    url,
    path = "/xml"
)
r$headers$"Content-Type"

r <- httr::GET(
    url,
    path = "/robots.txt"
)
r$headers$"Content-Type"

r <- httr::GET(
    url,
    path = "/basic-auth/konrad/wdib123"
)
r

http_status(r)$reason

r <- httr::GET(
    url,
    path = "/basic-auth/konrad/wdib123",
    authenticate(
        "konrad",
        "wdib123"
    )
)
r

http_status(r)$reason

r <- httr::GET(
    url,
    path = "/user-agent"
)
r

r <- httr::GET(
    url,
    path = "/user-agent",
    user_agent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15")
)
r

r <- httr::GET(
    url,
    path = "/cookies"
)
r

r <- httr::GET(
    url,
    path = "/cookies",
    set_cookies(
        "Cookie" = "Monster"
    )
)
r
#mozna 
r <- httr::GET(
    url,
    path = "/anything",
    query = list(
        "jeden" = 1,
        "dwa" = 2
    )
)
r
#mozna
r <- httr::POST(
    url,
    path = "/post",
    add_headers(
        "Referer" = "Referer: http://httpbin.org/forms/post"
    ),
    set_cookies(
        "freeform" = ""
    ),
    body = list(
        "custname" = "Jan",
        "custtel" = "123-456-789",
        "custemail" = "jan@kowalski.pl",
        "size" = "medium",
        "topping" = "onion",
        "delivery" = "12%3A15",
        "comments" = "3+pi%C4%99tro"
    )
)
r