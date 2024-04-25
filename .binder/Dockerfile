FROM rocker/binder:4.4.0
LABEL maintainer='Claudia Guerrero'
COPY --chown=${NB_USER} . ${HOME}
USER ${NB_USER}



RUN wget https://github.com/claudiaguerreros/analisisweb/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2024-04-25/')); devtools::install_deps()"

RUN rm DESCRIPTION.1; exit 0
