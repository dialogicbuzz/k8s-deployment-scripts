#/bin/sh
# Delete a kubernetes namespace that is stuck in the "Terminating" state.
#
# 

if [ $# -ne 1 ] ; then
  echo "Usage: $(basename $0) TENANT-NAMESPACE" >&2
  exit 1
fi

# Find kubectl binary
if [ -x "/usr/bin/kubectl" ]; then
  KUBECTL="/usr/bin/kubectl"
elif [ -x "/usr/local/bin/kubectl" ]; then
  KUBECTL="/usr/local/bin/kubectl"
else
  echo "Can't find kubectl" >&2
  exit 1
fi

if [[ $(${KUBECTL} get ns "${1}" -o json | jq -r '.status.phase') == "Terminating" ]]; then
  tmp="${1}.json"
  ${KUBECTL} get ns "${1}" -o json | jq 'del(.spec.finalizers[] | select("kubernetes"))' > "${tmp}"
  ${KUBECTL} proxy &>/dev/null &
  curl --silent --show-error --insecure -H "Content-Type: application/json" -X PUT --data-binary "@${tmp}" "http://127.0.0.1:8001/api/v1/namespaces/${1}/finalize" > /dev/null
  rm "${tmp}"
else
  echo "Namespace is not terminating" >&2
  exit 1
fi






