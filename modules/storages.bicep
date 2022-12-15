
param location string = resourceGroup().location
param appServiceAppName string
param appServicePlanName string
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'

resource StorageAccount1 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: lorenz-finalexam1
  location: location
  sku: {
    name: StorageAccount1SkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource SotrageAccount2 'Microsoft.Web/sites@2022-03-01' = {
name: lorenz-finalexam2
location: location
kind: 'StorageV1'
properties: {
  accessTier: 'Hot'
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName
