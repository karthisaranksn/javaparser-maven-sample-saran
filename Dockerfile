FROM ubuntu
WORKDIR /app
RUN touch file.txt
RUN echo "i am check how to create a Docker image using pipeline"
CMD ["/bin/bash"]
