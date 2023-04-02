FROM python:alpine
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
WORKDIR /app/templates
ADD https://raw.githubusercontent.com/bekirokutan/Terraform-Phonebook-Application/main/templates/add-update.html . 
ADD https://raw.githubusercontent.com/bekirokutan/Terraform-Phonebook-Application/main/templates/delete.html .
ADD https://raw.githubusercontent.com/bekirokutan/Terraform-Phonebook-Application/main/templates/index.html .
WORKDIR /app
EXPOSE 80
CMD python ./phonebook-app.py



