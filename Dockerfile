FROM tensorflow/tensorflow:1.11.0-devel-gpu
RUN apt-get update
RUN apt-get install -y protobuf-compiler python-pil python-lxml python-tk && \
    pip install Cython contextlib2 jupyter matplotlib
RUN mkdir tensorflow && git clone https://github.com/esmanchik/tensorflow-models.git tensorflow/models
RUN cd tensorflow/models/research && wget -O protobuf.zip \
    https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip && \
    unzip protobuf.zip && \
    ./bin/protoc object_detection/protos/*.proto --python_out=.
ENV PYTHONPATH $PYTHONPATH:/root/tensorflow/models/research:/root/tensorflow/models/research/slim
WORKDIR tensorflow/models/research