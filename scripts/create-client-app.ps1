# Create an Entra ID application for the client app (React / Next.js)
# and configure necessary API permissions.
param (
    [string]$appName = "DataAgent-MAF-Client-App",
    [string]$redirectUri = "http://localhost:3000"
)
# Create the application
$app = az ad app create `
    --display-name $appName `
    --spa-redirect-uris $redirectUri `
    --query "{appId: appId, objectId: id}" `
    --output json | ConvertFrom-Json
Write-Host "Created application with App ID: $($app.appId)"

# Add API permissions (e.g., User.Read)
az ad app permission add `
    --id $app.appId `
    --api 00000003-0000-0000-c000-000000000000 `
    --api-permissions e1fe6dd8-ba31-4d61-89e7-88639da4683d

Write-Host "Application setup complete. Details:"
Write-Host "App ID: $($app.appId)"
Write-Host "Object ID: $($app.objectId)"
Write-Host "Tenant ID: $(az account show --query tenantId --output tsv)"
Write-Host "Redirect URI: $redirectUri"
Write-Host "Please configure your frontend application with the above App ID and Redirect URI."
