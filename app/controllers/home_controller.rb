class HomeController < ApplicationController

  def create
    @support = Support.new(params[:support])
    if @support.save
    redirect_to('/', :notice => "Support was successfully sent.")
    else
      puts "Message Failed"
    end
  end

end
