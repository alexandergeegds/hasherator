FROM python:3.7-alpine3.9

WORKDIR /app
COPY requirements requirements
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements/build.txt

COPY src src

ENTRYPOINT ["pyinstaller", "--onefile"]
CMD ["src/main.py"]
