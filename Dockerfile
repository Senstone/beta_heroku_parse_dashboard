FROM node:argon-slim
ENV NPM_CONFIG_LOGLEVEL error
ENV DATABASE_URI=ec2-34-212-245-44.us-west-2.compute.amazonaws.com:27017
ENV PARSE_DASHBOARD_APP_ID=fc82dc46-2486-4933-8078-c98b02488647
ENV PARSE_DASHBOARD_ALLOW_INSECURE_HTTP=true
ENV PARSE_DASHBOARD_APP_NAME=senstone-io
ENV PARSE_DASHBOARD_MASTER_KEY=463498b1-623c-4c37-b647-a69956796035
ENV PARSE_DASHBOARD_SERVER_URL=http://parse-beta.us-west-2.elasticbeanstalk.com/parse
ENV PARSE_DASHBOARD_USER_ID=senstone
ENV PARSE_DASHBOARD_USER_PASSWORD=13Senstone
WORKDIR /src
ADD . /src
RUN cd /src \
 && npm install \
 && npm run build \
 && npm cache clear \
 && rm -rf ~/.npm \
 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["npm", "run", "dashboard"]
