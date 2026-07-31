param(
    [string]$Environment = "stage"
)

$varFile = "$Environment.tfvars"

if (-not (Test-Path $varFile)) {
    throw "Terraform variable file '$varFile' was not found."
}

terraform fmt -check

if ($LASTEXITCODE -ne 0) {
    throw "Terraform formatting check failed."
}

terraform validate

if ($LASTEXITCODE -ne 0) {
    throw "Terraform validation failed."
}

terraform plan -var-file="$varFile" -out="tfplan"

if ($LASTEXITCODE -ne 0) {
    throw "Terraform plan failed."
}

terraform apply "tfplan"

if ($LASTEXITCODE -ne 0) {
    throw "Terraform apply failed."
}