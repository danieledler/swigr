FROM rocker/rstudio:4.1.0

RUN R --no-save -e 'install.packages("devtools")'

COPY . /home/rstudio/

WORKDIR /home/rstudio
