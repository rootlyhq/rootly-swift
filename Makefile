fetch-spec:
	curl -fs https://rootly-heroku.s3.amazonaws.com/swagger/v1/swagger.json -o Sources/Rootly/openapi.json

generate:
	swift package plugin --allow-writing-to-package-directory generate-code-from-openapi --target Rootly

build:
	swift build

test:
	swift test

lint:
	swiftlint lint --strict
