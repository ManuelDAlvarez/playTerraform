data "local_file" "rule-tree" {
    filename = "${path.module}/rules2.json"
}

data "local_file" "origin-md" {
    filename = "${path.module}/origin-md.json"
}


