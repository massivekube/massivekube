FROM python:3

WORKDIR /src

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . /src

EXPOSE 8000

ENTRYPOINT [ "mkdocs" ]

CMD [ "serve", "-a","0.0.0.0:8000 ]

