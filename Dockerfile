# VERSION 0.0.1
FROM ruby:latest
MAINTAINER heidsoft "heidsoft@qq.com"

# install ruby
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/
RUN gem install jekyll
RUN gem install rdiscount

WORKDIR /opt

COPY . /opt

WORKDIR /opt/heidsoft.github.com

EXPOSE 4000

ENTRYPOINT jekyll serve


