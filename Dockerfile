#This Docker file is for cuda9 cudnn7 and python3.6.
#If you want to use different versions, you can change version number in the script

FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04 #use nvidia official image

#install python3.6 and pip
RUN apt-get update \
    && apt-get install -y python-software-properties \
    && apt-get install -y software-properties-common \ #to enable add-apt-repository
    && add-apt-repository ppa:jonathonf/python-3.6 \
    && apt-get update \
    && apt-get install -y python3.6 \ # install python3.6 
    && apt-get install -y python3.6-dev \ #install python3.6 dev to enable some package installation (spacy depends on this)
    && rm /usr/bin/python \ 
    && ln -s /usr/bin/python3.6 /usr/bin/python \
    && rm /usr/bin/python3 \
    && ln -s /usr/bin/python3.6 /usr/bin/python3 \ #redirect python3 and python. if you do not redirect, you can not install specific version of pytorch
    && apt-get -y install python3-pip \
    && ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install https://download.pytorch.org/whl/cu90/torch-0.4.1-cp36-cp36m-linux_x86_64.whl #please make sure python version there matchs to python the python3 refers
