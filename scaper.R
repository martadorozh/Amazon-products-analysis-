install.packages("scraperapi-sdk")
from scraper_api import ScraperAPIClient
client = ScraperAPIClient('e324f31dcbf1e09ff5810df8944b94bd')
result = client.get(url = 'http://httpbin.org/ip').text
print(result);