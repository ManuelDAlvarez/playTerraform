#resource "akamai_dns_zone" "demozone" {
#    contract = "ctr_C-1ED34DY"
#    group = grp_63802
#
#    zone = "sztykman.com"
#    type =  "primary"
#    comment =  "some comment"
#    signandserve = true
#}

# A record
#resource "akamai_dns_record" "test1" {
#    zone = "sztykman.com"
#    name = "demo2.sztykman.com"
#    recordtype =  "CNAME"
#    active = true
#    ttl =  600 
#    target = ["test.edgekey.net."]
#}