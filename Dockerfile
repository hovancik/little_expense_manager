FROM ruby:3.2

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean
RUN mkdir /usr/local/nvm

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 16.18.1

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm install --global yarn

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install --global yarn

RUN mkdir /little_expense_manager
WORKDIR /little_expense_manager

ADD Gemfile Gemfile.lock /little_expense_manager/

RUN bundle install

ADD package.json yarn.lock /little_expense_manager/
RUN yarn

ADD . /little_expense_manager
