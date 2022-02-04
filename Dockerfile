FROM python:3.9-alpine
RUN pip install -q yml2json jsonschema
WORKDIR /data
CMD [ "python3", "yaml_validate.py"]