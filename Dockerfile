FROM fedora:38

ARG IPMI_EXPORTER_VERSION=1.6.1

RUN yum -y install freeipmi
RUN curl -sfL -o /tmp/ipmi_exporter.tar.gz https://github.com/prometheus-community/ipmi_exporter/releases/download/v${IPMI_EXPORTER_VERSION}/ipmi_exporter-${IPMI_EXPORTER_VERSION}.linux-amd64.tar.gz && \
	tar -C /usr/bin -xvf /tmp/ipmi_exporter.tar.gz --strip-components 1

ENTRYPOINT ["/usr/bin/ipmi_exporter"]
