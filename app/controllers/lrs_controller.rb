class LrsController < ApplicationController
  load_and_authorize_resource
  
  
  before_filter :authenticate_user!
  
   def index
     @payvoucher = Payvoucher.all
     if params[:lrno]
       
       if params[:lrno].blank? || params[:company].blank?
         @lr = Lr.paginate(:page => params[:page], :per_page => 30, :order => 'lrno ASC')
         @msg = "Either of the fields cannot be blank, please input correct values and try again"
       else
         lrs=Lr.arel_table
         @lr = Lr.find(:all, :conditions => ['party ILIKE ? AND lrno = ?', "%#{params[:company]}%",params[:lrno]]) #this works on heroku
         @msg = "Showing search results for Lr number #{params[:lrno]} and Party #{params[:company]}"
       end
   
    #    @lr = Lr.where(lrs[:lrno].matches("%#{params[:lrno]}%").and(lrs[:party].matches("%#{params[:company]}%")))
   else
     @lr = Lr.paginate(:page => params[:page], :per_page => 30, :order => 'lrno ASC')
   end
   
   
   end

   def new
     @lr = current_user.lrs.new(params[:lr])
   end

   def show
   if Lr.find(params[:id]).present?
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
       @lr =  Lr.find(params[:id])
       Lr.find(params[:id]).delete
       Payvoucher.find_by_lr_id(@lr.id).delete if Payvoucher.find_by_lr_id(@lr.id)
       redirect_to root_path, :notice => "Success, Lr  Deleted"
     end
 
end
