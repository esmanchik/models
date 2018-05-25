FROM tensorflow/tensorflow:1.8.0-devel-gpu
RUN apt-get update && apt-get install -y protobuf-compiler python-pil python-lxml python-tk && pip install Cython jupyter matplotlib 
RUN export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
CMD ["bash"]