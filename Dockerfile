FROM alpine:latest

# Internal unprivileged user will have this ID:
ENV CONTAINER_USER_ID="1000" \
    CONTAINER_GROUP_ID="1000"

# Updates S.O. and adds system required packages
RUN apk update && apk add --no-cache bash nodejs nodejs-npm nano


# creates unprivileged user "user"
RUN adduser -D -u ${CONTAINER_USER_ID} -g ${CONTAINER_GROUP_ID} -h /home/user -s /bin/sh user

# Global npm folder writeable by "user"
RUN mkdir -p /opt/npm-global && \
    chown user:user /opt/npm-global

# After this point everything is done as unpriveleged user
USER user

# configures environment
ENV NPM_CONFIG_PREFIX=/opt/npm-global
ENV PATH=$NPM_CONFIG_PREFIX/bin:$PATH

# Install usefull npm packages
RUN npm install -g \
    npm \
    @angular/cli

EXPOSE 4200 49153
#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash"]
