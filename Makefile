.PHONY: stage publish clean

stage: CORSPROXY_HOST = corsproxy.staging.perio.do

publish: CORSPROXY_HOST = corsproxy.perio.do

stage publish: clean nginx.conf
	fly deploy

clean:
	rm -f nginx.conf

nginx.conf: nginx.template.conf
	CORSPROXY_HOST=$(CORSPROXY_HOST) \
	envsubst '$$CORSPROXY_HOST' < $< > $@
