.SILENT:
default: development

setup = brew bundle && \
	bundle install && \
	ls Scripts/*.sh | xargs chmod +x && \
	Scripts/decrypt.sh && \
	touch AibaShopAdmin/Configs/Config.swift

done = printf "\e[32m✓ %s\e[0m\n" "All Done ლ(╹◡╹ლ)"

development:
	$(setup)
	bundle exec fastlane configure_development_code_signing
	$(done)

distribution:
	$(setup)
	bundle exec fastlane configure_distribution_code_signing
	$(done)
