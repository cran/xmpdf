## -----------------------------------------------------------------------------
library("xmpdf")
x <- xmp(creator = "John Doe", date_created = "2023-02-10", spdx_id = "CC-BY-4.0")
print(x)

## -----------------------------------------------------------------------------
library("xmpdf")
x <- xmp(creator = "John Doe", date_created = "2023-02-10", spdx_id = "CC-BY-4.0")
x$auto_xmp <- base::setdiff(x$auto_xmp,
                            c("dc:rights", "photoshop:Credit"))
print(x)

## -----------------------------------------------------------------------------
library("xmpdf")
x <- xmp(creator = "John Doe", date_created = "2023-02-10")
x$rights <- "© 2023 A Corporation. Some rights reserved."
print(x)

## -----------------------------------------------------------------------------
library("xmpdf")
x <- xmp()
x$set_item("dc:contributor", c("John Doe", "Jane Doe"))
x$get_item("dc:contributor")

## -----------------------------------------------------------------------------
library("datetimeoffset")
library("xmpdf")
transcript <- c(en = "An English Transcript", 
                fr = "Une transcription française") |>
                  as_lang_alt(default_lang = "en")
last_edited <- "2020-02-04T10:10:10" |>
                   as_datetimeoffset()
x <- xmp()
x$set_item("Iptc4xmpExt:Transcript", transcript)
x$set_item("Iptc4xmpExt:IPTCLastEdited", last_edited)

## -----------------------------------------------------------------------------
library("xmpdf")
x <- xmp(attribution_url = "https://example.com/attribution",
         creator = "John Doe",
         description = "An image caption",
         date_created = Sys.Date(),
         spdx_id = "CC-BY-4.0")
print(x, mode = "google_images", xmp_only = TRUE)

## -----------------------------------------------------------------------------
library("xmpdf")
x <- xmp(attribution_url = "https://example.com/attribution",
         creator = "John Doe",
         description = "An image caption",
         date_created = Sys.Date(),
         spdx_id = "CC-BY-4.0")
print(x, mode = "creative_commons", xmp_only = TRUE)

## -----------------------------------------------------------------------------
library("xmpdf")
x <- xmp()
x$description <- "Description in only one default language"
x$title <- c(en = "An English Title",
             fr = "Une titre française")
# XMP tags without an active binding must be manually coerced by `as_lang_alt`
transcript <- c(en = "An English Transcript",
                fr = "Une transcription française") |>
                  as_lang_alt(default_lang = "en")
x$set_item("Iptc4xmpExt:Transcript", transcript)

