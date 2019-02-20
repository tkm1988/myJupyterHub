#!/bin/bash
docker container run --rm -p 8080:8000 -h "dtkmjh1f" --name "dtkmjh1f" -d \
       -v /Users/tkm/GitHub/myJupyterHub/src:/home/tkm1988/notebooks/ \
       myjupyterhub/myjupyterhub:latest \
       jupyterhub --no-ssl --config=/opt/jupyterhub_config.py
