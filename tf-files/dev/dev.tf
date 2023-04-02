module "phonebook" {
  source = "../modules"
  git-name = "bekirokutan"
  git-token ="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"
  key-name = "first-key"
  hosted-zone = "bekirokutan.com"
  database-name= "phonebook"
  database-user = "admin"
  database-pass = "Bekir1234"
  subdomain_name="phonebook.bekirokutan.com"
}
