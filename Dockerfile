FROM python:3.11-bullseye
WORKDIR /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
SHELL ["/bin/bash", "-c"]
RUN python3 -m venv /opt/venv
RUN source /opt/venv/bin/activate
RUN python3 -m pip install -r requirements.txt
RUN source setup.sh

EXPOSE 5000

WORKDIR /app
ENTRYPOINT ["run_demo.sh"]
