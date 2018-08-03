FROM jupyterhub/jupyterhub:latest
LABEL maintainer="tkm1988 <bumpbumpbump.v@gmail.com>"

# RUN apt-get -y letsencrypt &&\
#     rm -rf /var/lib/apt/lists/*
# RUN wget -N https://dl.eff.org/certbot-auto.asc

RUN conda install --yes --quiet --channel conda-forge notebook
RUN groupadd --gid 1000 tkm1988 && \
    useradd --password $6$lo5nagV2CDezu/DD$D0XyH6WmyBoQ0gVPNCyFXD1c7MMDs7Bkl/a43OAxPG86E5UIU2h.SBy1fGtoaPSMav1CxPvk6Ae.LHvV0bX0Y. --gid 1000 --uid 1000 tkm1988 && \
    mkdir -p /home/tkm1988/notebooks &&\
    chown tkm1988:tkm1988 /home/tkm1988/notebooks/
