FROM library/node

ADD package.json /app/package.json

RUN cd /app && npm install --production

ADD . /app

WORKDIR /app

CMD node .
