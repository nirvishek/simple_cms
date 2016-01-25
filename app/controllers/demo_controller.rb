class DemoController < ApplicationController
 
	layout false

  def hello
  end

  def index
  end

  def other_hello
  	redirect_to(:controller => 'demo' , :action => 'index')
  end

  def nicky
  	redirect_to('https://www.facebook.com/')
  end
end