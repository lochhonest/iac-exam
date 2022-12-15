@sys.description('Lorenz Web App')
@minLength(3)
@maxLength(24)
param appServiceAppName string = 'lorenz-app'
@sys.description('The App Service Plan name.')
@minLength(3)
@maxLength(24)
param appServicePlanName string = 'lorenz-asp'
@sys.description('The Storage Account name.')
@minLength(3)
@maxLength(24)
param storageAccountName string = 'lorenz-finalexam1'
@allowed([
  'nonprod'
  'prod'
  ])
param environmentType string = 'nonprod'
param location string = resourceGroup().location



module appService 'modules/storages.bicep' = {
  name: 'appService'
  params: { 
    location: location
    appServiceAppName: lorenz-app
    appServicePlanName: lorenz-asp
    environmentType: environmentType
  }
}

  output appServiceAppHostName string = appService.outputs.appServiceAppHostName

    
