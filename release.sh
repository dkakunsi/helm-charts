#! /bin/sh

release_reference() {
  echo "Releasing solution reference version $2"

  cd $1
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-iam --version $2
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-data --version $2
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-process --version $2
  helm pull oci://ghcr.io/cortechdigitallab/helm/reference-gateway --version $2

  cd ..
  helm repo index . --url https://cortechdigitallab.github.io/helm-charts

  commit_push $1 $2
}

commit_push() {
  git add .
  git commit -m "Update charts $1 to version $2"
  git push
}

############
### MAIN ###
############

if [[ -z "$1" ]] || [[ -z "$2" ]]; then

  echo "Solution or version is not specified"

else

  if [ "$1" == reference ]; then
    release_reference $1 $2
  else
    echo "Solution $1 is not exists"
  fi

fi
