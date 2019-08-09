#provider "google" {
#	credentials = "${file("/Users/maalvare/.ssh/GCP/account.json")}"
#	project = "terraform-245613"
#	region = "us-east4"
#}

provider "akamai" {
    edgerc = "/Users/maalvare/.edgerc"
    papi_section = "papi"
    dns_section = "papi"
}




