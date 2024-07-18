terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "browningluke"

    workspaces {
      name = "pve-template-sol-ubuntu-2404"
    }
  }
}
