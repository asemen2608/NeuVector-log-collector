#! /bin/sh

LANG="de_DE@euro iso-8859-15"
DATE="`date +%Y%m%d%H%M`"
NS="neuvector"

## create log dir
DI=log_$DATE
mkdir $DI

# collecting log files
kubectl -n $NS top nodes > $DI/top_nodes_$DATE.log
kubectl -n $NS top pods > $DI/top_pods_$DATE.log
kubectl -n $NS top pods | grep enforcer >  $DI/top_pods_enforcer_$DATE.log
#i ps aux
for i in `kubectl get pods -n $NS | awk '{print $1}'` 
    do
      #echo $i
      echo "kubectl -n $NS exec $i -- ps aux > $DI/ps_aux_pod_$i--$DATE.log"
      kubectl -n $NS exec $i -- ps aux > $DI/ps_aux_pod_$i--$DATE.log
    done

kubectl describe pods -n $NS > $DI/describe_pods._$DATE.log

for i in `kubectl get pods -n $NS | grep controller | awk '{print $1}'`;do kubectl logs $i -n $NS > $DI/$i.$DATE.log; done
#for i in `kubecSl get pods -n neuvector | grep controller | awk '{print $1}'`;do kubectl logs $i -n neuvector > $i_$DATE.log; done




