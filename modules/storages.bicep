
param location string = resourceGroup().location
param appServiceAppName string
param appServicePlanName string
@allowed([
  'nonprod'
  'prod'
])

param storageAccountNames array = ['lorenz-finalexam1', 'lorenz-finalexam2']
param environmentType string

var appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'

resource StorageAccountResources1 'Microsoft.Web/serverFarms@2022-03-01' = [for storageAccount in storageAccountNames: {
  name: storageAccount
  location: location
  sku: {
    name: appServicePlanSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}



output appServiceAppHostName string = appServiceApp.properties.defaultHostName
