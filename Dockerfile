FROM conda/miniconda3

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN conda create -n llava_int -c conda-forge -c pytorch python=3.10.8 pytorch=2.0.1 -y
RUN conda init bash
RUN conda activate llava_int
WORKDIR /app/LLaVA-Interactive-Demo
RUN pip install -r requirements.txt
RUN source setup.sh

WORKDIR /app
ENTRYPOINT ["run_demo.sh"]
