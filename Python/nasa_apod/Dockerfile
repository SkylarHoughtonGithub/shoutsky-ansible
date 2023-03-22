FROM rockylinux:9

RUN dnf install -y sudo python3 epel-release
RUN dnf install -y pip net-tools bind-utils

RUN groupadd shoutsky -g 1333
RUN adduser shoutsky -u 1333 -g 1333 
RUN echo "shoutsky ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/shoutsky
RUN chmod 0440 /etc/sudoers.d/shoutsky
RUN su - shoutsky

RUN mkdir -p /usr/local/src/shoutsky
WORKDIR /usr/local/src/shoutsky

COPY . .
RUN pip install -r requirements.txt
RUN chown -R shoutsky. .

ENV FLASK_APP=src/app.py
ENV FLASK_ENV=development
CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0"]
