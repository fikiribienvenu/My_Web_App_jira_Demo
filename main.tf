# Local variable for file conntent
locals {
  app_code = <<EOT
console.log("Hello from Terraform-created web app!");
EOT
}

# Create index.js in a nested folder
resource "local_file" "webapp_app" {
  filename = "${path.module}/webapp/src/index.js"  # File path
  content  = local.app_code                        # File content
}

# Output the path of the created file
output "webapp_file_path" {
  value       = local_file.webapp_app.filename
  description = "The full path to the web application's index.js file."
}
