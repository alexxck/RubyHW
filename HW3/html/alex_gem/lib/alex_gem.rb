module Log

  def to_html (content)
    File.open("index.html", "w")  { |f|
    f << "<!DOCTYPE html>\n"
    f << "<html lang=\"ru\">\n"
    f << "  <head>\n"
    f << "    <meta charset=\"utf-8\">\n"
    f << "    <title>tamagotchi</title>\n"
    f << "  </head>\n"
    f << "  <body>\n"
    f << "    > #{@str}<!-- page content -->\n"
    f << "    <button value=\"refresh\" onClick=\"window.location.reload();\">refresh</button> "
    f << "  </body>\n"
    f << "</html>\n"
  }
  end
end
