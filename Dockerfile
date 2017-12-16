FROM node:alpine
ARG FISSION_VERSION=0.4.0
ENV FISSION_URL=http://controller.fission
ENV FISSION_ROUTER=router.fission
ADD https://github.com/fission/fission/releases/download/${FISSION_VERSION}/fission-cli-linux /usr/bin/fission
RUN chmod +x /usr/bin/fission
WORKDIR /opt/deployer
COPY . /opt/deployer/
RUN npm install \
    && npm link
WORKDIR /src
