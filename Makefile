.SILENT:
default: development

setup:
	@if [ -z "$(PASSPHRASE)" ]; then \
		echo "No passphrase provided"; \
		exit 1; \
	fi
	brew bundle && \
	bundle install && \
	chmod +x Scripts/*.sh && \
	Scripts/decrypt.sh
done = printf "\e[32m✓ %s\e[0m\n" "All Done ლ(╹◡╹ლ)"

development:
	$(setup)
	bundle exec fastlane configure_development_code_signing
	$(done)

distribution:
	$(setup)
	bundle exec fastlane configure_distribution_code_signing
	$(done)
