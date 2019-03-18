FROM python:3.7-alpine3.9

WORKDIR /app
COPY requirements requirements
COPY src src
COPY tests tests

RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements/test.txt

ENTRYPOINT ["python3", "-m"]
CMD ["pytest", "tests/unit"]
