class LrsController < ApplicationController
  load_and_authorize_resource
  
  
  before_filter :authenticate_user!
  
   def index
     @payvoucher = Payvoucher.all
     if params[:lrno]
     @lr = Lr.search(params[:lrno],params[:company])
   else
     @lr = Lr.paginate(:page => params[:page], :per_page => 30, :order => 'lrno ASC')
   end
   end

   def new
     @lr = current_user.lrs.new(params[:lr])
   end

   def show
     if Lr.find(params[:id])
       @lr = Lr.find(params[:id])
     else
       @lr = ""
     end

   end

   def create
      @lr = current_user.lrs.new(params[:lr].merge(:creation_location => "#{current_user.location}"))
       if @lr.save
         redirect_to root_path, :notice => "Success, Lr Created!"
       else
         redirect_to new_lr_path, :notice => "Oops, Lr creation failed!"
       end
   end
    def edit
       @lr = Lr.find(params[:id])
     end

     def update
       if Lr.find(params[:id]).update_attributes(params[:lr])
           redirect_to root_path, :notice => "Success, Lr  Updated!"
         else
           redirect_to edit_lr_path, :notice => "Oops, Lr updation failed!"
       end
     end

     def destroy
       Lr.find(params[:id]).delete
       redirect_to root_path, :notice => "Success, Lr  Deleted"
     end
 
end
