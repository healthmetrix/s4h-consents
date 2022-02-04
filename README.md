# Smart4Health Consents

[![Build Status](https://drone.healthmetrix.com/api/badges/healthmetrix/s4h-consents/status.svg)](https://drone.healthmetrix.com/healthmetrix/s4h-consents)

## Deployment

Deployment of the `main` branch of this repository as static assets takes place via netlify pointing
to https://consents.smart4health.eu

The `dev` branch will be available at https://dev.consents.smart4health.eu at a later point.

The build pipeline on drone has the only purpose to check (yaml-lint) and schema validate the files.

## Consents

The only active consent here is `research-consent-en` which will be accessible to dynamic-consent with the
consentId `smart4health-research-consent-en`.

`test-around-consent-en` is a playground, e.g. for applying some direct html rich-text stuff.

## Schema validation

To locally validate the schemas a [docker image](Dockerfile) is provided
at [healthmetrixgmbh/s4h-consents-validate](https://hub.docker.com/repository/docker/healthmetrixgmbh/s4h-consents-validate)
that should be run from the root dir of this repo like:

`docker run --rm -t -v $(pwd):/data healthmetrixgmbh/s4h-consents-validate`