FROM node:20 as builder

ARG FOUNDRY_URL=""
ARG FOUNDRY_ZIP="Dockerfile"

COPY --chown=0:0 --chmod=644 ${FOUNDRY_ZIP} foundry.zip

RUN if [-z "${FOUNDRY_ZIP}" ] ; then curl -o foundry.zip --location "${FOUNDRY_URL}" ; fi \
    && mkdir -p /foundry && unzip foundry.zip -d /opt/foundry

FROM node:20 as runner

RUN mkdir -p /opt/foundry
COPY --chown=0:0 --chmod=755 scripts/ /opt/foundry/
COPY --chown=0:0 --from=builder /opt/foundry /opt/foundry/

USER 1000
CMD ["/bin/sh", "-x", "/opt/foundry/entrypoint.sh"]
