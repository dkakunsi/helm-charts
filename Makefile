VERSION ?=
CHARTS_URL := https://dkakunsi.github.io/helm-charts

.PHONY: help bitapp

help:
	@echo "Usage: make <target> VERSION=<version>"
	@echo ""
	@echo "Targets:"
	@echo "  bitapp            Release bitapp chart"

bitapp:
	@echo "Releasing bitapp version $(VERSION)"
	@cd charts && \
		helm pull oci://ghcr.io/dkakunsi/helm/bitapp-app --version $(VERSION)
	@helm repo index . --url $(CHARTS_URL)
	@git add .
	@git commit -m "Release bitapp chart of version $(VERSION)"
	@git push
