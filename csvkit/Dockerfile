# Run csvkit tools in a container
#
# cat sometext.csv | docker run -i --rm edbizarro/csvkit csvlook
#
# or
# docker run -i --rm edbizarro/csvkit csvstat < sometxt.csv
FROM python:3-alpine

ARG BUILD_DATE                                                                                                                                                       
ARG VCS_REF                                                                                                                                                          

LABEL maintainer="Eduardo Bizarro <edbizarro@gmail.com>" \                                                                                                                                                      
  org.label-schema.name="edbizarro/gitlab-ci-pipeline-php" \
  org.label-schema.description=":coffee: Docker images for build and test PHP applications with Gitlab CI (or any other CI plataform!)" \
  org.label-schema.build-date=$BUILD_DATE \ 
  org.label-schema.schema-version="1.0" \
  org.label-schema.vcs-url="https://github.com/edbizarro/gitlab-ci-pipeline-php" \
  org.label-schema.vcs-ref=$VCS_REF
	

RUN apk add --no-cache --virtual .build-deps build-base \
	&& pip3 install csvkit \
	&& apk del .build-deps

WORKDIR /root