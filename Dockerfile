FROM jupyterhub/jupyterhub:latest
LABEL maintainer="tkm1988 <bumpbumpbump.v@gmail.com>"

COPY ./opt /opt
WORKDIR /opt
RUN chmod -R 777 .
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install $(cat /opt/apt_requirements.txt) -y
RUN groupadd --gid 1001 wheel
RUN echo "%wheel	ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers
RUN groupadd --gid 1000 tkm1988 && \
    useradd --password '$6$lo5nagV2CDezu/DD$D0XyH6WmyBoQ0gVPNCyFXD1c7MMDs7Bkl/a43OAxPG86E5UIU2h.SBy1fGtoaPSMav1CxPvk6Ae.LHvV0bX0Y.' --gid 1000 --uid 1000 tkm1988 && \
    mkdir -p /home/tkm1988/notebooks &&\
    chown tkm1988:tkm1988 /home/tkm1988/ &&\
    chown tkm1988:tkm1988 /home/tkm1988/notebooks/
RUN usermod -G wheel tkm1988
RUN pip install --upgrade pip && \
  pip install environment_kernels
RUN sudo /opt/conda/bin/conda update --all
RUN conda env create --file /opt/myenv.yaml
RUN conda install -c conda-forge $(cat /opt/conda_requirements.txt)
USER tkm1988
WORKDIR /home/tkm1988
