#! /bin/sh

release_solution() {
  CHART_VERSION=${1}
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-iam --version $CHART_VERSION
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-data --version $CHART_VERSION
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-process --version $CHART_VERSION
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-gateway --version $CHART_VERSION
}

cd ./charts

if [ "$1" == solution ]; then
  release_solution $2
fi

cd ..
helm repo index .

git add .
git commit -m "Update charts"
git push
