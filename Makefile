fetch-spec:
	curl -fs https://rootly-heroku.s3.amazonaws.com/swagger/v1/swagger.json -o Sources/Rootly/openapi.json

generate:
	swift run swift-openapi-generator generate Sources/Rootly/openapi.json \
		--config Sources/Rootly/openapi-generator-config.yaml \
		--output-directory Sources/Rootly/GeneratedSources

build:
	swift build

test:
	swift test

lint:
	swiftlint lint --strict
