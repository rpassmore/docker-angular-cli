FROM node:alpine

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# Updates S.O. and adds system required packages
RUN apk add --no-cache bash nano zsh

USER node

# Install usefull npm packages
RUN mkdir ~/.npm-global \
    && mkdir ~/app \
    && npm install -g \
    npm \
    @angular/cli

EXPOSE 4200 49153
#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/zsh"]
