install-deps:
	git submodule update --init --recursive
	cd ./libs/github.com/cncf/xds && git checkout d92e9ce0af512a73a3a126b32fa4920bee12e180
	cd ./libs/github.com/envoyproxy/protoc-gen-validate && git checkout v0.6.2
	cd ./libs/github.com/googleapis/googleapis && git checkout 82944da21578a53b74e547774cf62ed31a05b841
	cd ./libs/github.com/census-instrumentation/opencensus-proto && git checkout v0.3.0
	cd ./libs/github.com/open-telemetry/opentelemetry-proto && git checkout v0.11.0
	cd ./libs/github.com/prometheus/client_model && git checkout 147c58e9608a4f9628b53b6cc863325ca746f63a
	cd ./libs/github.com/envoyproxy/envoy && git checkout v1.21.0
	go install github.com/chrusty/protoc-gen-jsonschema/cmd/protoc-gen-jsonschema@1.3.5

generate-json-schema:
	$(MAKE) generate-json-schema-version VERSION=v2
	$(MAKE) generate-json-schema-version VERSION=v3

generate-json-schema-version:
	@-mkdir -p ./build/$(VERSION)
	@protoc --jsonschema_out=./build/$(VERSION) \
		-I$(PWD)/libs/github.com/cncf/xds \
		-I$(PWD)/libs/github.com/cncf/udpa \
		-I$(PWD)/libs/github.com/envoyproxy/protoc-gen-validate \
		-I$(PWD)/libs/github.com/googleapis/googleapis \
		-I$(PWD)/libs/github.com/census-instrumentation/opencensus-proto/src \
		-I$(PWD)/libs/github.com/open-telemetry/opentelemetry-proto \
		-I$(PWD)/libs/github.com/prometheus/client_model \
		-I$(PWD)/libs/github.com/envoyproxy/envoy/api \
		$(PWD)/libs/github.com/envoyproxy/envoy/api/envoy/config/bootstrap/$(VERSION)/bootstrap.proto