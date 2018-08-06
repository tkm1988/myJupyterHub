FROM jupyterhub/jupyterhub:latest
LABEL maintainer="tkm1988 <bumpbumpbump.v@gmail.com>"

COPY ./opt /opt
WORKDIR /opt
RUN pip install --upgrade pip
RUN pip install -r packages_requirements.txt
RUN groupadd --gid 1000 tkm1988 && \
    useradd --password '$6$lo5nagV2CDezu/DD$D0XyH6WmyBoQ0gVPNCyFXD1c7MMDs7Bkl/a43OAxPG86E5UIU2h.SBy1fGtoaPSMav1CxPvk6Ae.LHvV0bX0Y.' --gid 1000 --uid 1000 tkm1988 && \
    mkdir -p /home/tkm1988/notebooks &&\
    chown tkm1988:tkm1988 /home/tkm1988/ &&\
    chown tkm1988:tkm1988 /home/tkm1988/notebooks/