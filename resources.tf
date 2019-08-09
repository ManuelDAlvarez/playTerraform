resource "akamai_edge_hostname" "tf-demo" {
    product  = "prd_SPM"
    contract = "ctr_C-1ED34DY"
    group    = "grp_63802"
    edge_hostname = "hmh-tf-v3.demo.edgesuite.net"
    ipv6 = true
}


resource "akamai_property" "terraform-7" {
    name    = "terraform-7"
    contact = ["maalvare@akamai.com"]

    product  = "prd_SPM"
    contract = "ctr_C-1ED34DY"
    group    = "grp_63802"
    cp_code = "cpc_378312"

    rule_format = "v2017-06-19"
    rules       = "${data.local_file.rule-tree.content}"
    hostnames = {"www.manuel.test" = "hmh-tf-v3.demo.edgesuite.net", "hmh-tf-v3.demo.edgesuite-staging.net" = "hmh-tf-v2.demo.edgesuite.net"}

}

resource "akamai_property" "manuelOrigin" {
    name    = "manuel.origin.md"
    contact = ["maalvare@akamai.com"]
    product  = "prd_SPM"
    contract = "ctr_C-1ED34DY"
    group    = "grp_63802"
    cp_code = "cpc_498884"
    #new rules because it is a new configuration
    rule_format = "v2019-07-25"
    rules       = "${data.local_file.origin-md.content}"
    hostnames = {
        "manuel.origin.edgekey-staging.net" = "manuel.origin.edgekey.net", "manuel.origin.edgekey.net" = "manuel.origin.edgekey.net", "manuel.origin2.edgekey.net" = "manuel.origin2.edgekey.net", "manuel.origin2.edgekey-staging.net" = "manuel.origin2.edgekey.net"
    }

}

resource "akamai_property_activation" "manuelOriginactivation" {
    property = "${akamai_property.manuelOrigin.id}"
    version  = "${akamai_property.manuelOrigin.version}"
    contact  = ["manuel@akamai.com"] 
    network  = "STAGING"
    activate = true
}

