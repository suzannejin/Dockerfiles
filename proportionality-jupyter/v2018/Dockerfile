# Docker inheritance
FROM suzannejin/dismay:v3.5

# snapshot date 
ARG WHEN='2018-10-24'

# install R packages - scDesign2
ADD requirements-scdesign2.R /tmp/requirements-scdesign2.R 
RUN Rscript /tmp/requirements-scdesign2.R

# install other R packages
ADD requirements-other.R /tmp/requirements-other.R 
RUN Rscript /tmp/requirements-other.R



# =============== #
# INSTALL JUPYTER #
# =============== #

## Python 3 installations
RUN apt-get update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository universe \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install python3 python3-dev \
	&& curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py \
	&& python3 get-pip.py \
	&& pip3 install wheel \
	## Install sklearn, pandas, jupyter notebook on python
	&& pip3 install numpy \
	sklearn \
	pandas \
	pyyaml \
	cwltool \
	jupyter \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf get-pip.py

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    inkscape \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    # ----
    tzdata \
    unzip \
    nano-tiny \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install jupyter R kernel
RUN R -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/${WHEN}/')); \
  install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'uuid', 'digest', 'IRkernel'))" && \
    R -e "IRkernel::installspec(user = FALSE)"

# Install jupyter bash kernel
RUN pip3 install bash_kernel && python3 -m bash_kernel.install

# install jupyter extensions
# and use useful extensions: Codefolding, ExecuteTime, Highlighter, limit output, Scratchpad, Skip-Traceback, Spellchecker, Table of Content (toc2), Variable inspector
RUN pip install jupyter_contrib_nbextensions
RUN pip install jupyter_nbextensions_configurator
RUN jupyter contrib nbextension install 
RUN jupyter nbextensions_configurator enable 
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension install https://rawgit.com/jfbercher/small_nbextensions/master/highlighter.zip 
RUN jupyter nbextension enable highlighter/highlighter

# install memory resource usage checker
RUN pip install jupyter-resource-usage
