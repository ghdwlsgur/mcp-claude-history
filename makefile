.PHONY: refresh

refresh:
	@echo "Pushing to remote repository..."
	@./script/update_claude_config.sh
