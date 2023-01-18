variable "name" {
    description = "name to used"
    type = string
    default = "gitops"
  
}

variable "project_id" {
    description = "project id"
    type = string
  
}

variable "region" {
    description = "region to use"
    type = string
    default = "us-central1-c"
  
}

variable "location" {
    description = "location to use"
    type = string
    default = "us-central1"
  
}

variable "machine-type" {
    description = "machine type to use"
    type = string
    default = "e2-medium"
  
}

variable "cluster-count" {
    description = " different cluster"
    type = map
    default = {
        cluster1 = gitops_1
        cluster2 = gitops_2
    }
  
}