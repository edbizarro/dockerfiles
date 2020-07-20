# Run great_expectations in a container
#
FROM python:3-slim

ARG BUILD_DATE                                                                                                                                                       
ARG VCS_REF                                                                                                                                                          

LABEL maintainer="Eduardo Bizarro <edbizarro@gmail.com>" \                                                                                                                                                      
  org.label-schema.name="edbizarro/dockerfiles" \
  org.label-schema.description=":coffee: Dockerfiles to make (my) your life easier" \
  org.label-schema.build-date=$BUILD_DATE \ 
  org.label-schema.schema-version="1.0" \
  org.label-schema.vcs-url="https://github.com/edbizarro/dockerfiles" \
  org.label-schema.vcs-ref=$VCS_REF

ADD ./requirements.txt ./

RUN apt-get update -yqq \
  && apt-get install --no-install-recommends -yqq ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache \
  && pip install --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt

# Run great_expectations
CMD ["great_expectations"]