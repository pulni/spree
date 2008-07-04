class UsersController < Spree::BaseController

  resource_controller
  
  create.before do
    @user.login = @user.email 
  end

  create.after do
    #User.authenticate(@user.login, @user.password)    
    self.current_user = @user       
  end

  create.response do |wants|  
    wants.html {redirect_to :controller => :checkout, :action => :addresses}         
  end
end