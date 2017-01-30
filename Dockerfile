FROM swiftdocker/swift:latest

# Install the notebook
RUN apt-get update
RUN apt-get install -y gcc

RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install jupyter notebook==4.2.1

# Launchbot labels
LABEL name.launchbot.io="swift test"
LABEL workdir.launchbot.io="/usr/workdir"
LABEL 8888.port.launchbot.io="Jupyter Notebook"

# Set the working directory
WORKDIR /usr/workdir

# Expose the notebook port
EXPOSE 8888

# Start the notebook server
CMD jupyter notebook --no-browser --port 8888 --ip=*