FROM python:3.7-alpine

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY dist /dist
RUN pip install --no-cache-dir dist/sppr-*.whl

VOLUME ["/packages"]
EXPOSE 80

CMD ["waitress-serve", "--port=80", "--call", "sppr:app.start"]
