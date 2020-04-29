FROM python:3.7.2
LABEL maintainer="Suzanne Jin <suzanne.jin@crg.es>"


WORKDIR /usr/src/app

# Install python packages
RUN git clone https://github.com/suzannejin/Dockerfiles.git && \
    pip install --no-cache-dir -r Dockerfiles/python/requirements.txt

# Install R & IRkernel 
RUN apt-get update && apt-get install r-base && \
    R -e install.packages('IRkernel') && \
    R -e IRkernel::installspec()

# Install Jupyter Bash kernel
RUN pip install bash_kernel && python -m bash_kernel.install

ENTRYPOINT [ "python" ]