FROM frolvlad/alpine-miniconda3
LABEL org.pydata.bokeh.maintainer="Karel-van-de-Plassche <karelvandeplassche@gmail.com>"

# set default conda channels
RUN conda config --set auto_update_conda off
RUN conda config --append channels bokeh
RUN conda config --append channels conda-forge
RUN conda config --get channels

ARG BOKEH_VERSION
# Do not update conda for now
#RUN conda install --quiet --yes \
#    conda

RUN conda install --quiet --yes \
    bokeh=$BOKEH_VERSION \
    pandas=0.24.1 \
    nodejs ;\
    conda clean -ay

ARG TORNADO_VERSION
RUN sh -c 'if [[ ! -z "$TORNADO_VERSION" ]]; then echo Installing old tornado $TORNADO_VERSION; conda install --quiet --yes tornado=$TORNADO_VERSION; conda clean -ay; fi'

# Clean the conda environment
#RUN conda clean -ay

RUN python -c "import tornado; print('tornado version=' + tornado.version)"
# Workaround, just calling `bokeh info` crashes
RUN env BOKEH_RESOURCES=cdn bokeh info