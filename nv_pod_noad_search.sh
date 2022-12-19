#! /bin/sh

LANG="de_DE@euro iso-8859-15"
DATE="`date +%Y%m%d%H%M`"
NS=neuvector
POD=$1

# collecting pod date and node location
kubectl get pod -n $NS $POD -o wide  | awk '{print $1,$7}'

