DIR := ~/.devel/k8s-gitops/k8s-gitops.github.io

.PHONY: dev

setup:
	rm -rf $(DIR)
	mkdir -p $(DIR)

publish: setup
	hugo -d $(DIR)
	echo "publish this via \`github.com/k8s-gitops/k8s-gitops.com\`\n" > $(DIR)/README.md
	echo "\`make publish\`" >> $(DIR)/README.md
	echo "k8s-gitops.com" > $(DIR)/CNAME
	git -C $(DIR) init
	git -C $(DIR) remote add origin git@github.com:k8s-gitops/k8s-gitops.github.io
	git -C $(DIR) add $(DIR)
	git -C $(DIR) commit -m "auto update from makefile"
	git -C $(DIR) push origin --force master

dev:
	hugo serve --port 10000

