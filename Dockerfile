FROM ruby:2.7.1
ENV LANG C.UTF-8

RUN set -x \
    && curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
                          nodejs \
                          libpq-dev \
                          postgresql-client \
                          yarn \
                          ./google-chrome-stable_current_amd64.deb \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
