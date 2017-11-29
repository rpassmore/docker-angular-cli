FROM node:alpine

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# Updates S.O. and adds system required packages
RUN apk add --no-cache nano zsh git zsh-vcs

USER node

RUN     npm install -g @angular/cli

COPY ./src/.zgen /home/node/.zgen 
COPY ./src/.zshrc /home/node/.zshrc 
COPY ./src/.zcompdump /home/node/.zcompdump
#RUN zgen selfupdate && zgen update && zgen save

EXPOSE 4200 49153
#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/zsh"]
