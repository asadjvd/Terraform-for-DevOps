locals {
  name = "Asad Javed"
  age  = "20"
  my_obj = {
    key1 = 10
    key2 = "my_value"
  }
}

output "example" {
  value = upper(local.name)
}

output "example2" {
  value = pow(local.age, 2)
}

output "example3" {
  value = yamldecode(file("${path.module}/users.yaml")).users
}

output "example4" {
  value = yamlencode(local.my_obj)
}