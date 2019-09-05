resource "akamai_edge_hostname" "tf-demo" {
    product  = "prd_SPM"
    contract = "ctr_C-1ED34DY"
    group    = "grp_63802"
    edge_hostname = "tf-v5.demo.edgesuite.net"
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
    hostnames = {"www.manuel.test" = "tf-v5.demo.edgesuite.net", "hmh-tf-v3.demo.edgesuite-staging.net" = "tf-v5.demo.edgesuite.net"}

}

resource "akamai_property" "terraform-5" {
    name    = "example.terraform-5.com"
    contact = ["maalvare@akamai.com"]
    product  = "prd_SPM"
    contract = "ctr_C-1ED34DY"
    group    = "grp_63802"
    cp_code = "cpc_498884"
    #new rules because it is a new configuration
    rule_format = "v2019-07-25"
    rules       = "${data.local_file.origin-md.content}"
    hostnames = {
        "www.terraform-5.com" = "manuel.origin.edgekey.net", "dev.terraform-5.com" = "manuel.origin2.edgekey.net"
    }

}

resource "akamai_property_activation" "terraform-5-activation" {
    property = "${akamai_property.terraform-5.id}"
    version  = "${akamai_property.terraform-5.version}"
    contact  = ["manuel@akamai.com"] 
    network  = "STAGING"
    activate = false
}

resource "akamai_property_activation" "terraform-7-activation" {
    property = "${akamai_property.terraform-7.id}"
    version  = "${akamai_property.terraform-7.version}"
    contact  = ["manuel@akamai.com"] 
    network  = "STAGING"
    activate = false
}

