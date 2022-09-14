FROM ruby:3.1.2
RUN apt-get update -qq

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y yarn

RUN mkdir /little_expense_manager
WORKDIR /little_expense_manager

ADD Gemfile Gemfile.lock /little_expense_manager/

RUN bundle install

ADD package.json yarn.lock /little_expense_manager/
RUN yarn

ADD . /little_expense_manager
