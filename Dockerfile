FROM ruby:2.3.1-onbuild

MAINTAINER jun.sasaki <jun.sasaki@geek.co.jp>

VOLUME /usr/src/app/source

EXPOSE 3000

ENV PATH=/usr/local/bin:$PATH
ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION=8.2.1

RUN set -x && \
    apt-get update && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash && \
    . $HOME/.nvm/nvm.sh && \
    nvm install $NODE_VERSION && \
    npm i browser-sync lodash.debounce && \
    ln -s /root/.nvm/versions/node/v8.2.1/bin/node /usr/local/bin/node && \
    ln -s /root/.nvm/versions/node/v8.2.1/bin/npm /usr/local/bin/npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./entrypoint.sh"]
CMD ["dev"]
