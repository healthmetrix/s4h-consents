# Smart4Health Consents

[![Build Status](https://drone.healthmetrix.com/api/badges/healthmetrix/s4h-consents/status.svg)](https://drone.healthmetrix.com/healthmetrix/s4h-consents)

## Deployment

Deployment of the `main` branch of this repository as static assets takes place via netlify pointing
to https://consents.smart4health.eu

The `dev` branch could be available at https://dev.consents.smart4health.eu at a later point.

The build pipeline on drone has the only purpose to check (yaml-lint) and schema validate the files.

## Consents

The only active consents are `research-consent-en` and `research-consent-de` which will be accessible to dynamic-consent
with the
consentId `smart4health-research-consent-en` and `smart4health-research-consent-de`.

`test-around-consent-en` is a playground, e.g. for applying some direct html rich-text stuff.

## Onboarding a new consent (e.g. new language)

One can just clone a directory and rename the consentID. Things to watch out then:

1. The section "consent" in config.yaml is completely irrelevant, e.g. `id: s4h-consent-en`. Only the name of the
   directory if of importance in terms of being the consentId.
2. If changing the PDF, you have to check that the PDF coordinates are still matching (see below)! This could require to
   run dynamic consent locally next to serving this repo locally.

## Schema validation

To locally validate the schemas a [docker image](Dockerfile) is provided
at [healthmetrixgmbh/s4h-consents-validate](https://hub.docker.com/repository/docker/healthmetrixgmbh/s4h-consents-validate)
that should be run from the root dir of this repo like:

`docker run --rm -t -v $(pwd):/data healthmetrixgmbh/s4h-consents-validate`

## PDF Coordinates

When a new PDF needs to be added, we need to calculate the coordinates of the various checkboxes and inputs to insert
text at. To do this, go to the [following url](https://pdfbox.apache.org/download.cgi) and download the first command
line tool (pdfbox-app-<VERSION>.jar). Then, load a specific PDF with the following command:

```shell script
java -jar <path/to/pdfbox-app.jar> PDFDebugger <path/to/pdf>
```

You can then page through the PDF and hover over spots to find out the coordinates. Sometimes the coordinates are not
100% accurate, and you need to play around with them. To try it out locally, the dynamic-consent project's signPdfTask
can be used.

Notice that pdf page numbers are 0-indexed.

PDFs should be provided with a ISO compliant export, e.g. PDF/A and at least PDF Version 1.5. Otherwise inserted texts
could be hidden on some PDF viewers.
