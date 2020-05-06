# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=datascience-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Suzanne Jin <suzanne.jin@crg.eu>"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root


# Add jupyterlab extensions
RUN jupyter labextension install @jupyterlab/toc

# Add python modules
RUN pip install openpyxl
