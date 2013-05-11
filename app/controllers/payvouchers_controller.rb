class PayvouchersController < ApplicationController
  load_and_authorize_resource
  
  
  before_filter :authenticate_user!
  
   def index
     @payvoucher = Payvoucher.paginate(:page => params[:page], :per_page => 30, :order => 'lrno ASC')
   end

   def new
     if Payvoucher.find_by_lr_id(params[:id])
       redirect_to root_path
     else
     @lr = Lr.find(params[:id])
     @payvoucher = Payvoucher.new(params[:payvouchers])
   end
   end


   def create
     @lr = Lr.find(params[:payvoucher][:lr_id])
     @totalamnt = params[:payvoucher][:balpaid].to_i + @lr.advance.to_i
     @c = Payvoucher.new(params[:payvoucher].merge(:lr_id => "#{@lr.id}", :lrno=> "#{@lr.lrno}", :party => "#{@lr.party}", :creation_location => "#{current_user.location}", :totalamnt => @totalamnt ))
     if @c.save
     redirect_to "/payvouchers/" , :notice => "Success Policy created !"
     else
     redirect_to "/payvouchers/new?id=#{@lr.id}" , :notice => "Oops policy creation failed"  
     end

   end

   def show
     if Payvoucher.find(params[:id])
       @payvoucher = Payvoucher.find(params[:id])
     else
       @payvoucher = ""
     end

   end

  
    def edit
       @payvoucher = Payvoucher.find(params[:id])
     end

     def update
       if Payvoucher.find(params[:id]).update_attributes(params[:lr])
           redirect_to root_path, :notice => "Success, Payvoucher  Updated!"
         else
           redirect_to edit_lr_path, :notice => "Oops, Payvoucher updation failed!"
       end
     end

     def destroy
       Payvoucher.find(params[:id]).delete
       redirect_to root_path, :notice => "Success, Payvoucher  Deleted"
     end
end
