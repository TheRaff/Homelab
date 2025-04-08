variable "PM_API_URL" {
    sensitive   = false  
    type        = string
}

variable "PM_API_TOKEN_ID" {
    sensitive   = true  
    type        = string
}

variable "PM_API_TOKEN_SECRET" {
    sensitive   = true  
    type        = string
}