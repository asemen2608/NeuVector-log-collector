#! /bin/sh

LANG="de_DE@euro iso-8859-15"
DATE="`date +%Y%m%d%H%M`"
NS=neuvector

# collecting log files
kubectl -n $NS top nodes > top_nodes_$DATE.log
kubectl -n $NS top pods > top_pods_$DATE.log
kubectl -n $NS top pods | grep enforcer >  top_pods_enforcer_$DATE.log
kubectl describe pods -n $NS > describe_pods._$DATE.log

for i in `kubectl get pods -n $NS | grep controller | awk '{print $1}'`;do kubectl logs $i -n $NS > $i.$DATE.log; done
#for i in `kubectl get pods -n $NS | grep controller | awk '{print $1}'`;do kubectl logs $i -n $NS > $i_$DATE.log; done




