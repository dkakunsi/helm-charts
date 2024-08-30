#! /bin/sh

cd ./charts

CHART_VERSION=${1}
helm pull oci://ghcr.io/cortechdigitallab/helm/reference/iam --version $CHART_VERSION
helm pull oci://ghcr.io/cortechdigitallab/helm/reference/data --version $CHART_VERSION
helm pull oci://ghcr.io/cortechdigitallab/helm/reference/process --version $CHART_VERSION
helm pull oci://ghcr.io/cortechdigitallab/helm/reference/gateway --version $CHART_VERSION

cd ..
helm repo index .
