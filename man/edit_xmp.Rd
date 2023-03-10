% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/edit_xmp.R
\name{edit_xmp}
\alias{edit_xmp}
\alias{get_xmp}
\alias{get_xmp_exiftool}
\alias{set_xmp}
\alias{set_xmp_exiftool}
\title{Set/get xmp metadata}
\usage{
get_xmp(filename, use_names = TRUE)

get_xmp_exiftool(filename, use_names = TRUE)

set_xmp(xmp, input, output = input)

set_xmp_exiftool(xmp, input, output = input)
}
\arguments{
\item{filename}{Filename(s) to extract xmp metadata from.}

\item{use_names}{If \code{TRUE} (default) use \code{filename} as the names of the result.}

\item{xmp}{An \code{\link[=xmp]{xmp()}} object.}

\item{input}{Input filename.}

\item{output}{Output filename.}
}
\value{
\code{get_xmp()} returns a list of \code{\link[=xmp]{xmp()}} objects.
\code{set_xmp()} returns the (output) filename invisibly.
}
\description{
\code{get_xmp()} gets xmp metadata from a file.
\code{set_xmp()} sets xmp metadata for a file.
}
\details{
\code{get_xmp()} will try to use the following helper functions in the following order:
\enumerate{
\item \code{get_xmp_exiftool()} which wraps \code{exiftool} command-line tool
}

\code{set_xmp()} will try to use the following helper functions in the following order:
\enumerate{
\item \code{set_xmp_exiftool()} which wraps \code{exiftool} command-line tool
}
}
\examples{
  x <- xmp(attribution_url = "https://example.com/attribution",
           creator = "John Doe",
           description = "An image caption",
           date_created = Sys.Date(),
           spdx_id = "CC-BY-4.0")
  print(x)
  print(x, mode = "google_images", xmp_only = TRUE)
  print(x, mode = "creative_commons", xmp_only = TRUE)

  if (supports_set_xmp() &&
      supports_get_xmp() &&
      capabilities("png") &&
      requireNamespace("grid", quietly = TRUE)) {

    f <- tempfile(fileext = ".png")
    png(f)
    grid::grid.text("This is an image!")
    invisible(dev.off())
    set_xmp(x, f)
    print(get_xmp(f)[[1]])
  }
}
\seealso{
\code{\link[=xmp]{xmp()}} for more information about xmp metadata objects.
\code{\link[=supports_get_xmp]{supports_get_xmp()}}, \code{\link[=supports_set_xmp]{supports_set_xmp()}}, and \code{\link[=supports_exiftool]{supports_exiftool()}} to detect support for these features.  For more info about xmp metadata see \url{https://www.exiftool.org/TagNames/XMP.html}.
}
