#! /bin/sh

LANG="de_DE@euro iso-8859-15"
DATE="`date +%Y%m%d%H%M`"

#kubectl -n neuvector exec -it neuvector-manager-pod-name -- cli
##neuvector-svc-controller.neuvector> login
#admin#neuvector-svc-controller.neuvector> show controller
#admin#neuvector-svc-controller.neuvector> request controller <controller_id> profile -c all
#admin#neuvector-svc-controller.neuvector> show enforcer
#admin#neuvector-svc-controller.neuvector> request enforcer <enforcer_id> profile -c all
#admin#neuvector-svc-controller.neuvector> exit

#The default profiling duration is 30s.  So after 35 seconds, the profiles should be available to copy from each of the NeuVector controller and enforcer pods under the /var/neuvector/profile folder.


# collect logs fron controller enforcer
for i in `kubectl get pods -n neuvector | egrep "controller|enforcer" | awk '{print $1}'`;do kubectl -n neuvector cp $i:/var/neuvector/profile $i.profile_$DATE; done




