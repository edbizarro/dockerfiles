# Run csvkit tools in a container
#
# cat sometext.csv | docker run -i --rm edbizarro/csvkit csvlook
#
# or
#
# docker run -i --rm edbizarro/csvkit csvstat < sometxt.csv
FROM python:3-alpine

ARG BUILD_DATE                                                                                                                                                       
ARG VCS_REF                                                                                                                                                          

LABEL maintainer="Eduardo Bizarro <edbizarro@gmail.com>" \                                                                                                                                                      
  org.label-schema.name="edbizarro/dockerfiles" \
  org.label-schema.description=":coffee: Dockerfiles to make (my) your life easier" \
  org.label-schema.build-date=$BUILD_DATE \ 
  org.label-schema.schema-version="1.0" \
  org.label-schema.vcs-url="https://github.com/edbizarro/dockerfiles" \
  org.label-schema.vcs-ref=$VCS_REF
	

RUN apk add --no-cache --virtual .build-deps build-base \
	&& pip3 install csvkit \
	&& apk del --purge .build-deps \
	&& rm -rf /tmp/* \
		/usr/includes/* \
		/usr/share/man/* \
		/usr/src/* \
		/var/cache/apk/* \
		/var/tmp/*

WORKDIR /root
