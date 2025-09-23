# Before -----------------------------------

# Render to html
quarto::quarto_render()

# Print to pdf
#
# Use decktape docker image
#
# In the slides folder, in the terminal:
# sudo docker run --rm -t -v "`pwd`:/slides" -v ".:/home/user" ghcr.io/astefanutti/decktape reveal --fragments /home/user/index.html intro_to_quarto.pdf
#
# Note the use of 'reveal --fragments' which may or may not be necessary in future (see https://github.com/astefanutti/decktape/issues/353)

# Old method:
#
# pagedown::chrome_print(
#   "index.html",
#   output = "intro_to_quarto.pdf",
#   extra_args = "--font-render-hinting=none"
# )

# Make PDF small
system(glue::glue(
  "gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 ",
  "-dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH ",
  "-sOutputFile='intro_to_quarto_sm.pdf' ",
  "'intro_to_quarto.pdf'"
))


# After --------------

# Make release

usethis::use_github_release()
