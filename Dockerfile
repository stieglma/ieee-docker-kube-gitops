FROM marpteam/marp-cli:v2.5.0

COPY slides/slides.md /home/marp/app/slides.md

CMD ["-s", "."]
