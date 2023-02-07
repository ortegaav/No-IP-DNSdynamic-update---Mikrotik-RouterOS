##############Script Settings##################

:local NOIPUser "your_no-ip_user"
:local NOIPPass "your_no-ip_pass"
:local WANInter "your_external_interface"
:local NOIPDomain "hostname.no-ip.net"

###############################################

# Get the current IP on the interface
:local currentIP [/ip address get [find interface="$WANInter" disabled=no] address]

# Strip the net mask off the IP address
   :for i from=( [:len $currentIP] - 1) to=0 do={
       :if ( [:pick $currentIP $i] = "/") do={ 
           :set currentIP [:pick $currentIP 0 $i]
       } 
   }

:if ([:resolve $NOIPDomain] != $currentIP) do={
      /tool fetch mode=http user=$NOIPUser password=$NOIPPass url="http://dynupdate.no-ip.com/nic/update\3Fhostname=$NOIPDomain&myip=$currentIP" keep-result=no
      :log info "NO-IP Update: $NOIPDomain - $currentIP"
}
