# Makefile for deploying the Flutter web projects to GitHub

# Replace this with your GitHub username
GITHUB_USER = Kratosgado
GITHUB_REPO = https://github.com/Kratosgado/Kratosgado.github.io
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

# Deploy the Flutter web project to GitHub
deploy:

#   @echo "Clean existing repository"
#   flutter clean

#   @echo "Getting packages..."
#   flutter pub get

	@echo "Building for web..."
	flutter build web --release

	@echo "Deploying to git repository"
	cd build/web && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git push -u -f origin main

	@echo "✅ Finished deploy: $(GITHUB_REPO)"
	@echo "🚀 Flutter web URL: https://$(GITHUB_USER).github.io/$(OUTPUT)/"

.PHONY: deploy