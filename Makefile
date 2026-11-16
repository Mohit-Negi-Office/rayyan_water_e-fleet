.DEFAULT_GOAL := help

FLAVORS := dev qa staging production

.PHONY: help clean-get gen-file

help:
	@printf '%s\n' \
		'Flavors: dev, qa, staging, production' \
		'The entry point selects the flavor: lib/main_<flavor>.dart' \
		'Run and build targets copy .env.<flavor> to .env first.' \
		'Production reads .env.prod. Pass DEVICE=<id> to run-<flavor>.' \
		'' \
		'Run:' \
		'  make load-env-dev' \
		'  make run-dev' \
		'  make run-qa' \
		'  make run-staging' \
		'  make run-production' \
		'  make run-android-<flavor>' \
		'  make run-android-<flavor>-release' \
		'  make run-ios-<flavor>' \
		'' \
		'Build:' \
		'  make build-apk-<flavor>' \
		'  make build-apk-<flavor>-debug' \
		'  make build-aab-<flavor>' \
		'  make build-aab-<flavor>-debug' \
		'  make build-ios-<flavor>' \
		'  make build-ipa-<flavor>' \
		'' \
		'Utilities:' \
		'  make clean-get' \
		'  make gen-file'

gen-file:
	dart run build_runner build

clean-get:
	flutter clean
	flutter pub get
	$(MAKE) gen-file

define FLAVOR_RULES
.PHONY: load-env-$(1) run-$(1) run-android-$(1) run-android-$(1)-release \
	run-ios-$(1) \
	build-apk-$(1) build-apk-$(1)-debug \
	build-aab-$(1) build-aab-$(1)-debug \
	build-ios-$(1) build-ipa-$(1)

load-env-$(1):
	@./scripts/load_env.sh $(1)

run-$(1): load-env-$(1)
	flutter run $$(if $$(DEVICE),-d "$$(DEVICE)",) -t lib/main_$(1).dart

run-android-$(1): load-env-$(1)
	@id=$$$$(adb devices | awk '$$$$2=="device"{print $$$$1}' | head -1); \
	test -n "$$$$id" || { echo "No Android device/emulator detected. Start an emulator first."; exit 1; }; \
	flutter run -d "$$$$id" -t lib/main_$(1).dart

run-android-$(1)-release: load-env-$(1)
	@id=$$$$(adb devices | awk '$$$$2=="device"{print $$$$1}' | head -1); \
	test -n "$$$$id" || { echo "No Android device/emulator detected. Start an emulator first."; exit 1; }; \
	flutter run -d "$$$$id" --release -t lib/main_$(1).dart

run-ios-$(1): load-env-$(1)
	@id=$$$$(xcrun simctl list devices booted | grep -oE '[A-F0-9]{8}-([A-F0-9]{4}-){3}[A-F0-9]{12}' | head -1); \
	test -n "$$$$id" || { echo "No booted iOS simulator. Open Simulator.app first."; exit 1; }; \
	flutter run -d "$$$$id" -t lib/main_$(1).dart

build-apk-$(1): load-env-$(1)
	flutter build apk --release -t lib/main_$(1).dart --obfuscate --split-debug-info=build/symbols/apk-$(1)

build-apk-$(1)-debug: load-env-$(1)
	flutter build apk --debug -t lib/main_$(1).dart

build-aab-$(1): load-env-$(1)
	flutter build appbundle --release -t lib/main_$(1).dart --obfuscate --split-debug-info=build/symbols/aab-$(1)

build-aab-$(1)-debug: load-env-$(1)
	flutter build appbundle --debug -t lib/main_$(1).dart

build-ios-$(1): load-env-$(1)
	flutter build ios --release --no-codesign -t lib/main_$(1).dart --obfuscate --split-debug-info=build/symbols/ios-$(1)

build-ipa-$(1): load-env-$(1)
	flutter build ipa --release -t lib/main_$(1).dart --obfuscate --split-debug-info=build/symbols/ipa-$(1)
endef

$(foreach flavor,$(FLAVORS),$(eval $(call FLAVOR_RULES,$(flavor))))
