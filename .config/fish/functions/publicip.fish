# function publicip
#   set -l ip
#   set -l domains "http://myexternalip.com/raw"
#                  "ip.appspot.com" \
#                  "ip.telize.com" \
#                  "wtfismyip.com/text" \
#                  "icanhazip.com" \
#                  "https://secure.internode.on.net/webtools/showmyip?textonly=1" \

#   for domain in $domains
#     set ip (curl $domain --fail --silent)
#     if test $ip 
#       echo $ip
#       break
#     end
#   end
# end

function publicip
    dig +short myip.opendns.com @resolver1.opendns.com
end
