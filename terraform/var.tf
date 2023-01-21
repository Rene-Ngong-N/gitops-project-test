variable "name" {
    description = "name to used"
    type = set(string)
    default = (["gitops-1", "gitops-2" ])
  
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