variable "region" {}
variable "sharedCredentialsFile" {}
variable "profile" {}
variable "customerIp" {}

provider "aws"{
  shared_credentials_file = "${var.sharedCredentialsFile}"
  profile = "${var.profile}"
  region = "${var.region}"
}

module "network" {
  source = "./modules/network"
  vpcFullCidr             = "10.0.0.0/16"
  subnetPrivate           = "10.0.0.0/24"
  availabilityZone        = "us-east-1a"
  tags                    = {
    client    = "lumstondev"
    Name      = "lumston"
    project   = "develop"
  }
}

module "securityGroups"{
  source = "./modules/securityGroups/"
  networkVPC  = "${module.network.lumstonVPC}"
  tags   = {
    client    = "lumstondev"
    Name      = "Private SG"
    project   = "develop"
  }
}

module "logGroups"{
  source = "./modules/logGroups/"
  tags   = {
    client    = "lumstondev"
    Name      = "endpoint logs"
    project   = "develop"
  }
}

module "vpn"{
  source   = "./modules/vpn"
  vpnls    = "${module.logGroups.logEndPointname}"
  private  = "${module.network.privateNet}"
  vpnIP    = "10.1.0.0/22"
  arnCert  = "arn:aws:acm:us-east-1:579977506858:certificate/2510983b-6e5a-4d1a-8c2d-69e2f72f1354"
  tags   = {
    client    = "lumstondev"
    Name      = "EndPoint Lumston"
    project   = "develop"
  }
}
