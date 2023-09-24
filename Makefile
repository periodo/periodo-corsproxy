.PHONY: stage publish clean

stage: APP_CONFIG = fly.stage.toml
stage: CORSPROXY_HOST = corsproxy.staging.perio.do

publish: APP_CONFIG = fly.publish.toml
publish: CORSPROXY_HOST = corsproxy.perio.do

stage publish: clean nginx.conf
	fly deploy --config $(APP_CONFIG)

clean:
	rm -f nginx.conf

nginx.conf: nginx.template.conf
	CORSPROXY_HOST=$(CORSPROXY_HOST) \
	envsubst '$$CORSPROXY_HOST' < $< > $@
