FROM python As development

WORKDIR /var/app

COPY main.py /var/app

ENTRYPOINT ["python", "./main.py"]
