fetch-spec:
	curl -fs https://rootly-heroku.s3.amazonaws.com/swagger/v1/swagger.json -o Sources/Rootly/openapi.json

build:
	swift build

test:
	swift test

lint:
	swiftlint lint --strict
