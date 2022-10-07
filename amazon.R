library(robotstxt)
library(rvest)
library(selectr)
library(xml2)
library(dplyr)
library(stringr)
library(forcats)
library(magrittr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(tibble)
library(purrr)



paths_allowed(
    paths = c("https://www.amazon.com/s?k=cell+phone&i=computers-intl-ship&crid=FMZMDA9MU926&sprefix=cell+p%2Ccomputers-intl-ship%2C293&ref=nb_sb_ss_ts-doa-p_1_6")
)



top_phones <- read_html("https://www.amazon.com/s?k=cell+phone&i=computers-intl-ship&crid=FMZMDA9MU926&sprefix=cell+p%2Ccomputers-intl-ship%2C293&ref=nb_sb_ss_ts-doa-p_1_6")
top_phones


top_phones %>%
    html_nodes(".a-text-normal") %>%
     html_attr("href")

<h2 class="mgn2_14 m9qz_yp mqu1_16 mp4t_0 m3h2_0 mryx_0 munh_0"><a class="_w7z6o _uj8z7 meqh_en mpof_z0 mqu1_16 _9c44d_2vTdY  " href="https://allegro.pl/oferta/apple-iphone-7-oryginal-gwarancja-sklep-9858540012" title="">Apple iPhone 7 / ORYGINAŁ / GWARANCJA / SKLEP</a></h2>
    top_phones %>%
      html_nodes("a[class='a-link-normal a-text-normal']") %>%
      html_text() %>%
      str_split('\\(')
    

    html_content <- content(r, "text") %>%
    read_html()





    site_links <- html_content %>%
    html_nodes("a[class='a-link-normal a-text-normal']") %>%
    html_attr("href")



top_phones %>%
       html_nodes("a[class='a-link-normal a-text-normal")
       html_attr("href")


       top_phones %>%
      html_nodes("a[class='a-link-normal a-text-normal']") %>%
      html_text() %>%
      str_split('\\(') %>%
      map_chr(1) %>%
      str_trim() -> device_name

##########
      for (link in top_phones) {
          print(link)
      }



> paths_allowed(
+     paths = c("https://www.amazon.com/s?k=cell+phone&i=computers-intl-ship&crid=FMZMDA9MU926&sprefix=cell+p%2Ccomputers-intl-ship%2C293&ref=nb_sb_ss_ts-doa-p_1_6")
+ )
 www.amazon.com                      

[1] TRUE
> top_phones <- read_html("https://www.amazon.com/s?k=cell+phone&i=computers-intl-ship&crid=FMZMDA9MU926&sprefix=cell+p%2Ccomputers-intl-ship%2C293&ref=nb_sb_ss_ts-doa-p_1_6")
> top_phones
{html_document}
<html lang="en-us" class="a-no-js" data-19ax5a9jf="dingo">
[1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<script>var aPageStart = (new Date()).g ...
[2] <body class="a-m-us a-aui_72554-c a-aui_csa_templates_buildin_ww_exp_337518-t1 a-aui_csa_templates_buildin_ww_launch ...
> top_phones %>%
+     html_nodes(".a-section a-spacing-none a")
{xml_nodeset (0)}
> top_phones %>%
+     html_nodes(".a-size-medium a-color-base a-text-normal span")
{xml_nodeset (0)}
> top_phones %>%
+     html_nodes("h2")
{xml_nodeset (18)}
 [1] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [2] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [3] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [4] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [5] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [6] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [7] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [8] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
 [9] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[10] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[11] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[12] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[13] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[14] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[15] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[16] <h2 class="a-size-mini a-spacing-none a-color-base s-line-clamp-2">\n<a class="a-link-normal a-text-normal" href="/ ...
[17] <h2 class="related-posts-carousel-header-text">\n                        Related inspiration\n                    < ...
[18] <h2 class="a-spacing-small a-spacing-top-mini">\n\n\n<span class="a-text-normal" dir="auto">Need help?</span>\n\n</h2>
> top_phones %>%
+      html_nodes(".a-size-mini a-spacing-none a-color-base s-line-clamp-2 h2")
{xml_nodeset (0)}
> top_phones %>%
+      html_nodes("a[class='a-link-normal a-text-normal']")
{xml_nodeset (17)}
 [1] <a class="a-link-normal a-text-normal" href="/Microphone-Cancelling-Controls-Headphones-Softphone/dp/B087JLGZLN/ref ...
 [2] <a class="a-link-normal a-text-normal" href="/Adjustable-AICase-Telescopic-Universal-Compatible/dp/B07QNHY56G/ref=s ...
 [3] <a class="a-link-normal a-text-normal" href="/Classic-Telephone-Handset-Microphone-Receiver/dp/B07GTWDMG1/ref=sr_1_ ...
 [4] <a class="a-link-normal a-text-normal" href="/Sharllen-Certified-Cell-Phone-Charging-Compatible/dp/B07L9X4TWZ/ref=s ...
 [5] <a class="a-link-normal a-text-normal" href="/Cellphone-Aluminum-Foldable-Magnetic-Expansion/dp/B08X3S5J8N/ref=sr_1 ...
 [6] <a class="a-link-normal a-text-normal" href="/Charging-Cable%EF%BC%8CArsiperd-Connector-Universal-Compatible/dp/B08 ...
 [7] <a class="a-link-normal a-text-normal" href="/Android-Charger-Charging-Motorola-BlackBerry/dp/B07JDCBNWY/ref=sr_1_7 ...
 [8] <a class="a-link-normal a-text-normal" href="/Micro-0-65ft-RAMPOW-Braided-Charger/dp/B089Y67SNP/ref=sr_1_8?crid=FMZ ...
 [9] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_ ...
[10] <a class="a-link-normal a-text-normal" href="/Adjustable-Holder-Office-Desktop-Smartphones/dp/B08B5WNRZQ/ref=sr_1_1 ...
[11] <a class="a-link-normal a-text-normal" href="/Charging-USAMS-Multiple-Connectors-Compatible/dp/B07QXVCFD1/ref=sr_1_ ...
[12] <a class="a-link-normal a-text-normal" href="/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_ ...
[13] <a class="a-link-normal a-text-normal" href="/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_ ...
[14] <a class="a-link-normal a-text-normal" href="/Kaisi-Adjustable-Fastening-Compatible-Samsung/dp/B075TXLZBS/ref=sr_1_ ...
[15] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_ ...
[16] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_ ...
[17] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_ ...
> 
> top_phones %>%
+      html_nodes("a[class='a-link-normal a-text-normal']")
{xml_nodeset (17)}
 [1] <a class="a-link-normal a-text-normal" href="/Microphone-Cancelling-Controls-Headphones-Softphone/dp/B087JLGZLN/ref ...
 [2] <a class="a-link-normal a-text-normal" href="/Adjustable-AICase-Telescopic-Universal-Compatible/dp/B07QNHY56G/ref=s ...
 [3] <a class="a-link-normal a-text-normal" href="/Classic-Telephone-Handset-Microphone-Receiver/dp/B07GTWDMG1/ref=sr_1_ ...
 [4] <a class="a-link-normal a-text-normal" href="/Sharllen-Certified-Cell-Phone-Charging-Compatible/dp/B07L9X4TWZ/ref=s ...
 [5] <a class="a-link-normal a-text-normal" href="/Cellphone-Aluminum-Foldable-Magnetic-Expansion/dp/B08X3S5J8N/ref=sr_1 ...
 [6] <a class="a-link-normal a-text-normal" href="/Charging-Cable%EF%BC%8CArsiperd-Connector-Universal-Compatible/dp/B08 ...
 [7] <a class="a-link-normal a-text-normal" href="/Android-Charger-Charging-Motorola-BlackBerry/dp/B07JDCBNWY/ref=sr_1_7 ...
 [8] <a class="a-link-normal a-text-normal" href="/Micro-0-65ft-RAMPOW-Braided-Charger/dp/B089Y67SNP/ref=sr_1_8?crid=FMZ ...
 [9] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_ ...
[10] <a class="a-link-normal a-text-normal" href="/Adjustable-Holder-Office-Desktop-Smartphones/dp/B08B5WNRZQ/ref=sr_1_1 ...
[11] <a class="a-link-normal a-text-normal" href="/Charging-USAMS-Multiple-Connectors-Compatible/dp/B07QXVCFD1/ref=sr_1_ ...
[12] <a class="a-link-normal a-text-normal" href="/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_ ...
[13] <a class="a-link-normal a-text-normal" href="/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_ ...
[14] <a class="a-link-normal a-text-normal" href="/Kaisi-Adjustable-Fastening-Compatible-Samsung/dp/B075TXLZBS/ref=sr_1_ ...
[15] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_ ...
[16] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_ ...
[17] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_ ...
>      html_attr("href")
Error in UseMethod("xml_attr") : 
  no applicable method for 'xml_attr' applied to an object of class "character"
> top_phones %>%
+      html_nodes("a[class='a-link-normal a-text-normal']") %>%
+      html_attr("href")
 [1] "/Microphone-Cancelling-Controls-Headphones-Softphone/dp/B087JLGZLN/ref=sr_1_1?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-1"                                                                                                                                                                                                                                                                                 
 [2] "/Adjustable-AICase-Telescopic-Universal-Compatible/dp/B07QNHY56G/ref=sr_1_2?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-2"                                                                                                                                                                                                                                                                                   
 [3] "/Classic-Telephone-Handset-Microphone-Receiver/dp/B07GTWDMG1/ref=sr_1_3?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-3"                                                                                                                                                                                                                                                                                       
 [4] "/Sharllen-Certified-Cell-Phone-Charging-Compatible/dp/B07L9X4TWZ/ref=sr_1_4?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-4"                                                                                                                                                                                                                                                                                   
 [5] "/Cellphone-Aluminum-Foldable-Magnetic-Expansion/dp/B08X3S5J8N/ref=sr_1_5?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-5"                                                                                                                                                                                                                                                                                      
 [6] "/Charging-Cable%EF%BC%8CArsiperd-Connector-Universal-Compatible/dp/B08ZKFQ6HT/ref=sr_1_6?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-6"                                                                                                                                                                                                                                                                      
 [7] "/Android-Charger-Charging-Motorola-BlackBerry/dp/B07JDCBNWY/ref=sr_1_7?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-7"                                                                                                                                                                                                                                                                                        
 [8] "/Micro-0-65ft-RAMPOW-Braided-Charger/dp/B089Y67SNP/ref=sr_1_8?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-8"                                                                                                                                                                                                                                                                                                 
 [9] "/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_sr_pg1_1?ie=UTF8&adId=A04517691NT2HF8EXVC79&url=%2FSmartphone-6-7inch-Fingerprint-Unlocked-Standby%2Fdp%2FB08CH9JD8J%2Fref%3Dsr_1_9_sspa%3Fcrid%3DFMZMDA9MU926%26dchild%3D1%26keywords%3Dcell%2Bphone%26qid%3D1619792146%26s%3Dcomputers-intl-ship%26sprefix%3Dcell%2Bp%252Ccomputers-intl-ship%252C293%26sr%3D1-9-spons%26psc%3D1&qualifier=1619792146&id=1849676383397939&widgetName=sp_mtf"                                 
[10] "/Adjustable-Holder-Office-Desktop-Smartphones/dp/B08B5WNRZQ/ref=sr_1_10?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-10"                                                                                                                                                                                                                                                                                      
[11] "/Charging-USAMS-Multiple-Connectors-Compatible/dp/B07QXVCFD1/ref=sr_1_11?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-11"                                                                                                                                                                                                                                                                                     
[12] "/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_1_12?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-12"                                                                                                                                                                                                                                                                                   
[13] "/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_1_12?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-12"                                                                                                                                                                                                                                                                                   
[14] "/Kaisi-Adjustable-Fastening-Compatible-Samsung/dp/B075TXLZBS/ref=sr_1_13?crid=FMZMDA9MU926&dchild=1&keywords=cell+phone&qid=1619792146&s=computers-intl-ship&sprefix=cell+p%2Ccomputers-intl-ship%2C293&sr=1-13"                                                                                                                                                                                                                                                                                     
[15] "/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_sr_pg1_1?ie=UTF8&adId=A003750739PP0O6ILNWTN&url=%2FSmartphone-Standby-Identification-5%25E2%2580%2591Point-100%25E2%2580%2591240V%2Fdp%2FB08FMC5X22%2Fref%3Dsr_1_14_sspa%3Fcrid%3DFMZMDA9MU926%26dchild%3D1%26keywords%3Dcell%2Bphone%26qid%3D1619792146%26s%3Dcomputers-intl-ship%26sprefix%3Dcell%2Bp%252Ccomputers-intl-ship%252C293%26sr%3D1-14-spons%26psc%3D1&qualifier=1619792146&id=1849676383397939&widgetName=sp_mtf"
[16] "/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_sr_pg1_1?ie=UTF8&adId=A052843319RXT894E3BAT&url=%2FCellEver-Premium-Leather-Scratch-Resistant-Anti-Slip%2Fdp%2FB07SJVLKC4%2Fref%3Dsr_1_15_sspa%3Fcrid%3DFMZMDA9MU926%26dchild%3D1%26keywords%3Dcell%2Bphone%26qid%3D1619792146%26s%3Dcomputers-intl-ship%26sprefix%3Dcell%2Bp%252Ccomputers-intl-ship%252C293%26sr%3D1-15-spons%26psc%3D1&qualifier=1619792146&id=1849676383397939&widgetName=sp_btf"                          
[17] "/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_sr_pg1_1?ie=UTF8&adId=A04536271EJHU04KXE8I8&url=%2FGallery-Crossbody-Cellphone-Wristlet-Wallets%2Fdp%2FB08949T132%2Fref%3Dsr_1_16_sspa%3Fcrid%3DFMZMDA9MU926%26dchild%3D1%26keywords%3Dcell%2Bphone%26qid%3D1619792146%26s%3Dcomputers-intl-ship%26sprefix%3Dcell%2Bp%252Ccomputers-intl-ship%252C293%26sr%3D1-16-spons%26psc%3D1&qualifier=1619792146&id=1849676383397939&widgetName=sp_btf"                                  
> top_phones %>%
+       html_nodes("a[class='a-link-normal a-text-normal']")
{xml_nodeset (17)}
 [1] <a class="a-link-normal a-text-normal" href="/Microphone-Cancelling-Controls-Headphones-Softphone/dp/B087JLGZLN/ref ...
 [2] <a class="a-link-normal a-text-normal" href="/Adjustable-AICase-Telescopic-Universal-Compatible/dp/B07QNHY56G/ref=s ...
 [3] <a class="a-link-normal a-text-normal" href="/Classic-Telephone-Handset-Microphone-Receiver/dp/B07GTWDMG1/ref=sr_1_ ...
 [4] <a class="a-link-normal a-text-normal" href="/Sharllen-Certified-Cell-Phone-Charging-Compatible/dp/B07L9X4TWZ/ref=s ...
 [5] <a class="a-link-normal a-text-normal" href="/Cellphone-Aluminum-Foldable-Magnetic-Expansion/dp/B08X3S5J8N/ref=sr_1 ...
 [6] <a class="a-link-normal a-text-normal" href="/Charging-Cable%EF%BC%8CArsiperd-Connector-Universal-Compatible/dp/B08 ...
 [7] <a class="a-link-normal a-text-normal" href="/Android-Charger-Charging-Motorola-BlackBerry/dp/B07JDCBNWY/ref=sr_1_7 ...
 [8] <a class="a-link-normal a-text-normal" href="/Micro-0-65ft-RAMPOW-Braided-Charger/dp/B089Y67SNP/ref=sr_1_8?crid=FMZ ...
 [9] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_ ...
[10] <a class="a-link-normal a-text-normal" href="/Adjustable-Holder-Office-Desktop-Smartphones/dp/B08B5WNRZQ/ref=sr_1_1 ...
[11] <a class="a-link-normal a-text-normal" href="/Charging-USAMS-Multiple-Connectors-Compatible/dp/B07QXVCFD1/ref=sr_1_ ...
[12] <a class="a-link-normal a-text-normal" href="/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_ ...
[13] <a class="a-link-normal a-text-normal" href="/Screens-Universal-Updated-Replacement-DiscsTips/dp/B08MT4DNHY/ref=sr_ ...
[14] <a class="a-link-normal a-text-normal" href="/Kaisi-Adjustable-Fastening-Compatible-Samsung/dp/B075TXLZBS/ref=sr_1_ ...
[15] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_mtf_computers-intl-ship_ ...
[16] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_ ...
[17] <a class="a-link-normal a-text-normal" href="/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers-intl-ship_ ...
> top_phones %>%
+       html_nodes("a[class='a-link-normal a-text-normal']") %>%
+       html_text()
 [1] "Cell Phone Headset with Microphone Noise Cancelling & Call Controls, 3.5mm Computer Headphones for iPhone Samsung PC Business Skype Softphone Call Center Office, Clear Chat, Ultra Comfort "             
 [2] "Adjustable Tablet/Phone Stand, AICase Telescopic Adjustable iPad Stand Holder,Universal Multi Angle Aluminum Stand Compatible with iPhone Smart Cell Phone/Tablet/iPad(4-13 inch), Red "                  
 [3] "Retro Handset, Cell Phone Handset Anti Radiation 3.5mm Mini Microphone Speaker for iPhone iPad,Mobile Phones,Computer Red "                                                                               
 [4] "Sharllen Lightning Cord 5Pack[3/3/6/6/10FT] Nylon Braided Cell-Phone Charging Cable USB Fast Charging & Syncing Long Cord,iPhone Charger Compatible iPhone XS/Max/XR/X/8/8P/7/7P/6/iPad/iPod Black&White "
 [5] "Screen Side Cell Phone Holder, Tesla Model 3 Model Y Cellphone Mount, Aluminum Slim Foldable Magnetic Expansion Laptop Stand, for Most Laptops Computer Monitor and Tesla (Black) "                       
 [6] "Multi USB Fast Charging Cable，Arsiperd 4 in 1 3A Charger Cord Connector with Dual Phone/Type C/Micro USB Universal Port Adapter, Compatible with Cell Phones Tablets and More(4FT/2Pack) "               
 [7] "Bynccea High Speed Micro USB Cable Android,4-Pack 1FT 3FT 6FT 10FT Cell Phone Charger Cord Nylon Braided Charging Cables Compatible with Samsung LG HTC Motorola Kindle BlackBerry Blue "                 
 [8] "Micro USB Cable [0.66ft] RAMPOW Braided Nylon Cell Phone Charger - QC 3.0 Fast Charging & Sync - Short Micro USB Charger 2.4A for Samsung Galaxy S5/S6/S7, HTC, LG, Sony, PS4, and More - Space Gray "    
 [9] "Smartphone, S20Plus 6.7inch Face Fingerprint Unlocked Dual Card Dual Standby Quad Core 6+64G Smartphone,5 Point Touch Screen, Fingerprint/face Unlock,with 128G Memory Card(US) "                         
[10] "Cell Phone Stand, Adjustable Phone Holder for Desk, Heavy Duty Cell Phone Holder for Home Office, Desktop Phone Holder Mount for iPhone, iPad, Tablet and All 4-13 Inches Smartphones -Black "            
[11] "Multi Charging Cable USAMS 2Pack 4FT 4 in 1 Nylon Braided Multiple USB Fast Charging Cord Adapter Type C Micro USB Port Connectors Compatible Cell Phones Tablets and More "                              
[12] "Stylus pens for Touch Screens(2 Pcs),Universal Stylus,[2-in-1] 2021 Updated Touch Screen Pens for All Touch Screens Cell Phones, Tablets, Laptops with 6 Replacement Tips(4 DiscsTips, 2 Fiber Tips) "    
[13] "+ "                                                                                                                                                                                                       
[14] "Kaisi Phone Screen Repair Tools Adjustable Fastening Clamps Clip Tools Compatible for Fixing Screen Uplift Cell Phone, iPhone, Samsung, iPad, iPod, MacBook, Laptops, Tablets, LCD Screen, 4 Pack "       
[15] "Smartphone,6.7in Screen Dual Card Dual Standby face Identification Smart Phone,5‑Point Touch Screen,Front Camera 800W + Back Camera 1300W,Stylish Design,Blue (100‑240V)(US) "                            
[16] "CellEver Compatible with iPhone SE 2020 Case/iPhone 7 Case/iPhone 8 Case, Premium Leather Guard Thin Slim Soft Flexible Scratch-Resistant Anti-Slip Luxury Vegan Leather Cover (Navy Blue) "              
[17] "Lam Gallery Fashion Crossbody Phone Purse for Women Holder Wallet Clutch Cloth Wristlet Wallets Handbag "                                                                                                 
> top_phones %>%
+       html_nodes("a[class='a-link-normal a-text-normal']") %>%
+       html_text() %>%
+       str_split('\\(')
[[1]]
[1] "Cell Phone Headset with Microphone Noise Cancelling & Call Controls, 3.5mm Computer Headphones for iPhone Samsung PC Business Skype Softphone Call Center Office, Clear Chat, Ultra Comfort "

[[2]]
[1] "Adjustable Tablet/Phone Stand, AICase Telescopic Adjustable iPad Stand Holder,Universal Multi Angle Aluminum Stand Compatible with iPhone Smart Cell Phone/Tablet/iPad"
[2] "4-13 inch), Red "                                                                                                                                                      

[[3]]
[1] "Retro Handset, Cell Phone Handset Anti Radiation 3.5mm Mini Microphone Speaker for iPhone iPad,Mobile Phones,Computer Red "

[[4]]
[1] "Sharllen Lightning Cord 5Pack[3/3/6/6/10FT] Nylon Braided Cell-Phone Charging Cable USB Fast Charging & Syncing Long Cord,iPhone Charger Compatible iPhone XS/Max/XR/X/8/8P/7/7P/6/iPad/iPod Black&White "

[[5]]
[1] "Screen Side Cell Phone Holder, Tesla Model 3 Model Y Cellphone Mount, Aluminum Slim Foldable Magnetic Expansion Laptop Stand, for Most Laptops Computer Monitor and Tesla "
[2] "Black) "                                                                                                                                                                   

[[6]]
[1] "Multi USB Fast Charging Cable，Arsiperd 4 in 1 3A Charger Cord Connector with Dual Phone/Type C/Micro USB Universal Port Adapter, Compatible with Cell Phones Tablets and More"
[2] "4FT/2Pack) "                                                                                                                                                                   

[[7]]
[1] "Bynccea High Speed Micro USB Cable Android,4-Pack 1FT 3FT 6FT 10FT Cell Phone Charger Cord Nylon Braided Charging Cables Compatible with Samsung LG HTC Motorola Kindle BlackBerry Blue "

[[8]]
[1] "Micro USB Cable [0.66ft] RAMPOW Braided Nylon Cell Phone Charger - QC 3.0 Fast Charging & Sync - Short Micro USB Charger 2.4A for Samsung Galaxy S5/S6/S7, HTC, LG, Sony, PS4, and More - Space Gray "

[[9]]
[1] "Smartphone, S20Plus 6.7inch Face Fingerprint Unlocked Dual Card Dual Standby Quad Core 6+64G Smartphone,5 Point Touch Screen, Fingerprint/face Unlock,with 128G Memory Card"
[2] "US) "                                                                                                                                                                       

[[10]]
[1] "Cell Phone Stand, Adjustable Phone Holder for Desk, Heavy Duty Cell Phone Holder for Home Office, Desktop Phone Holder Mount for iPhone, iPad, Tablet and All 4-13 Inches Smartphones -Black "

[[11]]
[1] "Multi Charging Cable USAMS 2Pack 4FT 4 in 1 Nylon Braided Multiple USB Fast Charging Cord Adapter Type C Micro USB Port Connectors Compatible Cell Phones Tablets and More "

[[12]]
[1] "Stylus pens for Touch Screens"                                                                                                              
[2] "2 Pcs),Universal Stylus,[2-in-1] 2021 Updated Touch Screen Pens for All Touch Screens Cell Phones, Tablets, Laptops with 6 Replacement Tips"
[3] "4 DiscsTips, 2 Fiber Tips) "                                                                                                                

[[13]]
[1] "+ "

[[14]]
[1] "Kaisi Phone Screen Repair Tools Adjustable Fastening Clamps Clip Tools Compatible for Fixing Screen Uplift Cell Phone, iPhone, Samsung, iPad, iPod, MacBook, Laptops, Tablets, LCD Screen, 4 Pack "

[[15]]
[1] "Smartphone,6.7in Screen Dual Card Dual Standby face Identification Smart Phone,5‑Point Touch Screen,Front Camera 800W + Back Camera 1300W,Stylish Design,Blue "
[2] "100‑240V)"                                                                                                                                                     
[3] "US) "                                                                                                                                                          

[[16]]
[1] "CellEver Compatible with iPhone SE 2020 Case/iPhone 7 Case/iPhone 8 Case, Premium Leather Guard Thin Slim Soft Flexible Scratch-Resistant Anti-Slip Luxury Vegan Leather Cover "
[2] "Navy Blue) "                                                                                                                                                                    

[[17]]
[1] "Lam Gallery Fashion Crossbody Phone Purse for Women Holder Wallet Clutch Cloth Wristlet Wallets Handbag "

> top_phones %>%
+       html_nodes("a[class='a-link-normal a-text-normal']") %>%
+       html_text() %>%
+       str_split('\\(') %>%
+       map_chr(1)
 [1] "Cell Phone Headset with Microphone Noise Cancelling & Call Controls, 3.5mm Computer Headphones for iPhone Samsung PC Business Skype Softphone Call Center Office, Clear Chat, Ultra Comfort "             
 [2] "Adjustable Tablet/Phone Stand, AICase Telescopic Adjustable iPad Stand Holder,Universal Multi Angle Aluminum Stand Compatible with iPhone Smart Cell Phone/Tablet/iPad"                                   
 [3] "Retro Handset, Cell Phone Handset Anti Radiation 3.5mm Mini Microphone Speaker for iPhone iPad,Mobile Phones,Computer Red "                                                                               
 [4] "Sharllen Lightning Cord 5Pack[3/3/6/6/10FT] Nylon Braided Cell-Phone Charging Cable USB Fast Charging & Syncing Long Cord,iPhone Charger Compatible iPhone XS/Max/XR/X/8/8P/7/7P/6/iPad/iPod Black&White "
 [5] "Screen Side Cell Phone Holder, Tesla Model 3 Model Y Cellphone Mount, Aluminum Slim Foldable Magnetic Expansion Laptop Stand, for Most Laptops Computer Monitor and Tesla "                               
 [6] "Multi USB Fast Charging Cable，Arsiperd 4 in 1 3A Charger Cord Connector with Dual Phone/Type C/Micro USB Universal Port Adapter, Compatible with Cell Phones Tablets and More"                           
 [7] "Bynccea High Speed Micro USB Cable Android,4-Pack 1FT 3FT 6FT 10FT Cell Phone Charger Cord Nylon Braided Charging Cables Compatible with Samsung LG HTC Motorola Kindle BlackBerry Blue "                 
 [8] "Micro USB Cable [0.66ft] RAMPOW Braided Nylon Cell Phone Charger - QC 3.0 Fast Charging & Sync - Short Micro USB Charger 2.4A for Samsung Galaxy S5/S6/S7, HTC, LG, Sony, PS4, and More - Space Gray "    
 [9] "Smartphone, S20Plus 6.7inch Face Fingerprint Unlocked Dual Card Dual Standby Quad Core 6+64G Smartphone,5 Point Touch Screen, Fingerprint/face Unlock,with 128G Memory Card"                              
[10] "Cell Phone Stand, Adjustable Phone Holder for Desk, Heavy Duty Cell Phone Holder for Home Office, Desktop Phone Holder Mount for iPhone, iPad, Tablet and All 4-13 Inches Smartphones -Black "            
[11] "Multi Charging Cable USAMS 2Pack 4FT 4 in 1 Nylon Braided Multiple USB Fast Charging Cord Adapter Type C Micro USB Port Connectors Compatible Cell Phones Tablets and More "                              
[12] "Stylus pens for Touch Screens"                                                                                                                                                                            
[13] "+ "                                                                                                                                                                                                       
[14] "Kaisi Phone Screen Repair Tools Adjustable Fastening Clamps Clip Tools Compatible for Fixing Screen Uplift Cell Phone, iPhone, Samsung, iPad, iPod, MacBook, Laptops, Tablets, LCD Screen, 4 Pack "       
[15] "Smartphone,6.7in Screen Dual Card Dual Standby face Identification Smart Phone,5‑Point Touch Screen,Front Camera 800W + Back Camera 1300W,Stylish Design,Blue "                                           
[16] "CellEver Compatible with iPhone SE 2020 Case/iPhone 7 Case/iPhone 8 Case, Premium Leather Guard Thin Slim Soft Flexible Scratch-Resistant Anti-Slip Luxury Vegan Leather Cover "                          
[17] "Lam Gallery Fashion Crossbody Phone Purse for Women Holder Wallet Clutch Cloth Wristlet Wallets Handbag "                                                                                                 
> top_phones %>%
+       html_nodes("a[class='a-link-normal a-text-normal']") %>%
+       html_text() %>%
+       str_split('\\(') %>%
+       map_chr(1) %>%
+       str_trim()
 [1] "Cell Phone Headset with Microphone Noise Cancelling & Call Controls, 3.5mm Computer Headphones for iPhone Samsung PC Business Skype Softphone Call Center Office, Clear Chat, Ultra Comfort"             
 [2] "Adjustable Tablet/Phone Stand, AICase Telescopic Adjustable iPad Stand Holder,Universal Multi Angle Aluminum Stand Compatible with iPhone Smart Cell Phone/Tablet/iPad"                                  
 [3] "Retro Handset, Cell Phone Handset Anti Radiation 3.5mm Mini Microphone Speaker for iPhone iPad,Mobile Phones,Computer Red"                                                                               
 [4] "Sharllen Lightning Cord 5Pack[3/3/6/6/10FT] Nylon Braided Cell-Phone Charging Cable USB Fast Charging & Syncing Long Cord,iPhone Charger Compatible iPhone XS/Max/XR/X/8/8P/7/7P/6/iPad/iPod Black&White"
 [5] "Screen Side Cell Phone Holder, Tesla Model 3 Model Y Cellphone Mount, Aluminum Slim Foldable Magnetic Expansion Laptop Stand, for Most Laptops Computer Monitor and Tesla"                               
 [6] "Multi USB Fast Charging Cable，Arsiperd 4 in 1 3A Charger Cord Connector with Dual Phone/Type C/Micro USB Universal Port Adapter, Compatible with Cell Phones Tablets and More"                          
 [7] "Bynccea High Speed Micro USB Cable Android,4-Pack 1FT 3FT 6FT 10FT Cell Phone Charger Cord Nylon Braided Charging Cables Compatible with Samsung LG HTC Motorola Kindle BlackBerry Blue"                 
 [8] "Micro USB Cable [0.66ft] RAMPOW Braided Nylon Cell Phone Charger - QC 3.0 Fast Charging & Sync - Short Micro USB Charger 2.4A for Samsung Galaxy S5/S6/S7, HTC, LG, Sony, PS4, and More - Space Gray"    
 [9] "Smartphone, S20Plus 6.7inch Face Fingerprint Unlocked Dual Card Dual Standby Quad Core 6+64G Smartphone,5 Point Touch Screen, Fingerprint/face Unlock,with 128G Memory Card"                             
[10] "Cell Phone Stand, Adjustable Phone Holder for Desk, Heavy Duty Cell Phone Holder for Home Office, Desktop Phone Holder Mount for iPhone, iPad, Tablet and All 4-13 Inches Smartphones -Black"            
[11] "Multi Charging Cable USAMS 2Pack 4FT 4 in 1 Nylon Braided Multiple USB Fast Charging Cord Adapter Type C Micro USB Port Connectors Compatible Cell Phones Tablets and More"                              
[12] "Stylus pens for Touch Screens"                                                                                                                                                                           
[13] "+"                                                                                                                                                                                                       
[14] "Kaisi Phone Screen Repair Tools Adjustable Fastening Clamps Clip Tools Compatible for Fixing Screen Uplift Cell Phone, iPhone, Samsung, iPad, iPod, MacBook, Laptops, Tablets, LCD Screen, 4 Pack"       
[15] "Smartphone,6.7in Screen Dual Card Dual Standby face Identification Smart Phone,5‑Point Touch Screen,Front Camera 800W + Back Camera 1300W,Stylish Design,Blue"                                           
[16] "CellEver Compatible with iPhone SE 2020 Case/iPhone 7 Case/iPhone 8 Case, Premium Leather Guard Thin Slim Soft Flexible Scratch-Resistant Anti-Slip Luxury Vegan Leather Cover"                          
[17] "Lam Gallery Fashion Crossbody Phone Purse for Women Holder Wallet Clutch Cloth Wristlet Wallets Handbag"                                                                                                 
> top_phones %>%
+       html_nodes("a[class='a-link-normal a-text-normal']") %>%
+       html_text() %>%
+       str_split('\\(') %>%
+       map_chr(1) %>%
+       str_trim() -> device_name
> device_name
 [1] "Cell Phone Headset with Microphone Noise Cancelling & Call Controls, 3.5mm Computer Headphones for iPhone Samsung PC Business Skype Softphone Call Center Office, Clear Chat, Ultra Comfort"             
 [2] "Adjustable Tablet/Phone Stand, AICase Telescopic Adjustable iPad Stand Holder,Universal Multi Angle Aluminum Stand Compatible with iPhone Smart Cell Phone/Tablet/iPad"                                  
 [3] "Retro Handset, Cell Phone Handset Anti Radiation 3.5mm Mini Microphone Speaker for iPhone iPad,Mobile Phones,Computer Red"                                                                               
 [4] "Sharllen Lightning Cord 5Pack[3/3/6/6/10FT] Nylon Braided Cell-Phone Charging Cable USB Fast Charging & Syncing Long Cord,iPhone Charger Compatible iPhone XS/Max/XR/X/8/8P/7/7P/6/iPad/iPod Black&White"
 [5] "Screen Side Cell Phone Holder, Tesla Model 3 Model Y Cellphone Mount, Aluminum Slim Foldable Magnetic Expansion Laptop Stand, for Most Laptops Computer Monitor and Tesla"                               
 [6] "Multi USB Fast Charging Cable，Arsiperd 4 in 1 3A Charger Cord Connector with Dual Phone/Type C/Micro USB Universal Port Adapter, Compatible with Cell Phones Tablets and More"                          
 [7] "Bynccea High Speed Micro USB Cable Android,4-Pack 1FT 3FT 6FT 10FT Cell Phone Charger Cord Nylon Braided Charging Cables Compatible with Samsung LG HTC Motorola Kindle BlackBerry Blue"                 
 [8] "Micro USB Cable [0.66ft] RAMPOW Braided Nylon Cell Phone Charger - QC 3.0 Fast Charging & Sync - Short Micro USB Charger 2.4A for Samsung Galaxy S5/S6/S7, HTC, LG, Sony, PS4, and More - Space Gray"    
 [9] "Smartphone, S20Plus 6.7inch Face Fingerprint Unlocked Dual Card Dual Standby Quad Core 6+64G Smartphone,5 Point Touch Screen, Fingerprint/face Unlock,with 128G Memory Card"                             
[10] "Cell Phone Stand, Adjustable Phone Holder for Desk, Heavy Duty Cell Phone Holder for Home Office, Desktop Phone Holder Mount for iPhone, iPad, Tablet and All 4-13 Inches Smartphones -Black"            
[11] "Multi Charging Cable USAMS 2Pack 4FT 4 in 1 Nylon Braided Multiple USB Fast Charging Cord Adapter Type C Micro USB Port Connectors Compatible Cell Phones Tablets and More"                              
[12] "Stylus pens for Touch Screens"                                                                                                                                                                           
[13] "+"                                                                                                                                                                                                       
[14] "Kaisi Phone Screen Repair Tools Adjustable Fastening Clamps Clip Tools Compatible for Fixing Screen Uplift Cell Phone, iPhone, Samsung, iPad, iPod, MacBook, Laptops, Tablets, LCD Screen, 4 Pack"       
[15] "Smartphone,6.7in Screen Dual Card Dual Standby face Identification Smart Phone,5‑Point Touch Screen,Front Camera 800W + Back Camera 1300W,Stylish Design,Blue"                                           
[16] "CellEver Compatible with iPhone SE 2020 Case/iPhone 7 Case/iPhone 8 Case, Premium Leather Guard Thin Slim Soft Flexible Scratch-Resistant Anti-Slip Luxury Vegan Leather Cover"                          
[17] "Lam Gallery Fashion Crossbody Phone Purse for Women Holder Wallet Clutch Cl
      

  