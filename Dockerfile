FROM ruby:2.1.3
MAINTAINER heidsoft <heidsoftg@gmail.com>
RUN gem sources --remove http://rubygems.org/
RUN gem sources -a http://ruby.taobao.org/
RUN gem install github-pages
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

ENV NODE_VERSION 0.10.33
RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
        && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
        && rm "node-v$NODE_VERSION-linux-x64.tar.gz"

RUN mkdir /opt/heidsoft
ADD . /opt/heidsoft

WORKDIR /opt/heidsoft
EXPOSE 4000

ENTRYPOINT ["jekyll"]
CMD ["serve"]
