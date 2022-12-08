#! /bin/sh

LANG="de_DE@euro iso-8859-15"
DATE="`date +%Y%m%d%H%M`"

# collecting log files
kubectl -n neuvector top nodes > top_nodes_$DATE.log
kubectl -n neuvector top pods > top_pods_$DATE.log
kubectl describe pods -n neuvector > describe_pods._$DATE.log

for i in `kubectl get pods -n neuvector | grep controller | awk '{print $1}'`;do kubectl logs $i -n neuvector > $i.$DATE.log; done
#for i in `kubectl get pods -n neuvector | grep controller | awk '{print $1}'`;do kubectl logs $i -n neuvector > $i_$DATE.log; done




