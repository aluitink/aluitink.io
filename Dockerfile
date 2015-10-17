FROM paintedfox/jekyll

RUN apt-get -y install python
RUN gem install markdown

WORKDIR /data
EXPOSE 80
ENTRYPOINT ["jekyll"]
