variable "region" {
  type    = string
  default = "us-east-1"
}

variable "assume_role" {
  type = object({
    role_arn    = string
    external_id = string
  })

  default = {
    role_arn    = "arn:aws:iam::760023434898:role/terraform-role"
    external_id = "de32345c-2ca9-43e9-b7b1-603db7316339"
  }
}

variable "vpc" {
  type = object({
    name                    = string
    cidr_block              = string
    internet_gateway_name   = string
    nat_gateway_name   = string
    public_route_table_name = string
    private_route_table_name = string
    eip_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })

  default = {
    name                    = "nsse-vpc"
    cidr_block              = "10.0.0.0/24"
    internet_gateway_name   = "internet_gateway"
    public_route_table_name = "public_route_table"
    private_route_table_name = "private_route_table"
    nat_gateway_name   = "nat-gateway"
    eip_name = "nat-gateway-eip"
    public_subnets = [{
      name                    = "public_us_east_1a"
      cidr_block              = "10.0.0.0/27"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "public_us_east_1b"
        cidr_block              = "10.0.0.64/27"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "private_us_east_1a"
      cidr_block              = "10.0.0.32/27"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "private_us_east_1b"
        cidr_block              = "10.0.0.96/27"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = false
    }]
  }
}
