class RegistrationsController < Devise::RegistrationsController

 protected
    
 # mettre à jour le profil sans demander le password
 def update_resource(resource, params)
     resource.update_without_password(params)
 end
end