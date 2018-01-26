class UsersController < ApplicationController
	#before_action :authenticate_user!

	def edit
		unless current_user.user_type == "Super_admin"
			@user = current_user
		else
			@user = User.find(params[:id])
		end
	end
	def update
		@user = User.find(params[:id])
		if current_user.id == @user.id || current_user.user_type == "Super_admin"
			if @user.update(user_params)
				redirect_back(fallback_location: edit_user_path)
			end
		end
		
	end

	def index
		@users = User.all
	end

	def select_rajya_padadhikari
		@users = User.all
		@users = @users.search_users(params[:search_param])
		if @users
			@users = current_user.except_current_user(@users)
		end
	end

	def admin_edit
	if current_user.user_type == "Super_admin"
		@user = User.find(params[:passed_user])
	end
	end

	def select_yuva_sanghatna
		@users = User.all
		@users = @users.search_users(params[:search_param])
		if @users
			@users = current_user.except_current_user(@users)
		end	
	end

	def select_tanta_mukti_samiti
		@users = User.all
	end
	def view_zilla_adhikari
		@district = params[:passed_params]
		@users = User.where(:work_at_district => @district)
		@summary =  Summary.new
		@summary_exists = Summary.all
		
		  if @district == "मुंबई_शहर"
  for summary_exist in @summary_exists
      if summary_exist.मुंबई_शहर != nil
        @summary_exist = summary_exist
        break
      end
    end 
  elsif @district == "मुंबई_उपनगर"
  for summary_exist in @summary_exists
      if summary_exist.मुंबई_उपनगर != nil
        @summary_exist = summary_exist
        break
      end
    end 
  elsif @district == "ठाणे"
  for summary_exist in @summary_exists
      if summary_exist.ठाणे != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "पालचर"
  for summary_exist in @summary_exists
      if summary_exist.पालचर != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "राजगड"
  for summary_exist in @summary_exists
      if summary_exist.राजगड != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "रत्नागिरी"
  for summary_exist in @summary_exists
      if summary_exist.रत्नागिरी != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "सिंधुदुर्ग"
  for summary_exist in @summary_exists
      if summary_exist.सिंधुदुर्ग != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "नाशिक"
  for summary_exist in @summary_exists
      if summary_exist.नाशिक != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "धुळे"
  for summary_exist in @summary_exists
      if summary_exist.धुळे != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "नंदुरबार"
  for summary_exist in @summary_exists
      if summary_exist.नंदुरबार != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "जळगाव"
  for summary_exist in @summary_exists
      if summary_exist.जळगाव != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "अहमदनगर"
  for summary_exist in @summary_exists
      if summary_exist.अहमदनगर != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "पुणे"
  for summary_exist in @summary_exists
      if summary_exist.पुणे != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "सातारा"
  for summary_exist in @summary_exists
      if summary_exist.सातारा != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "सांगली"
  for summary_exist in @summary_exists
      if summary_exist.सांगली != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "सोलापूर"
  for summary_exist in @summary_exists
      if summary_exist.सोलापूर != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "कोल्हापूर"
  for summary_exist in @summary_exists
      if summary_exist.कोल्हापूर != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "औरंगाबाद"
  for summary_exist in @summary_exists
      if summary_exist.औरंगाबाद != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "जालना"
  for summary_exist in @summary_exists
      if summary_exist.जालना != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "परभणी"
  for summary_exist in @summary_exists
      if summary_exist.परभणी != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "हिंगोली"
  for summary_exist in @summary_exists
      if summary_exist.हिंगोली != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "बीड"
  for summary_exist in @summary_exists
      if summary_exist.बीड != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "नांदेड"
  for summary_exist in @summary_exists
      if summary_exist.नांदेड != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "उस्मानाबाद"
  for summary_exist in @summary_exists
      if summary_exist.उस्मानाबाद != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "लातूर"
  for summary_exist in @summary_exists
      if summary_exist.लातूर != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "अमरावती"
  for summary_exist in @summary_exists
      if summary_exist.अमरावती != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "बुलढाणा"
  for summary_exist in @summary_exists
      if summary_exist.बुलढाणा != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "अकोला"
  for summary_exist in @summary_exists
      if summary_exist.अकोला != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "वाशिम"
  for summary_exist in @summary_exists
      if summary_exist.वाशिम != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "यवतमाळ"
  for summary_exist in @summary_exists
      if summary_exist.यवतमाळ != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "नागपूर"
  for summary_exist in @summary_exists
      if summary_exist.नागपूर != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "वर्धा"
  for summary_exist in @summary_exists
      if summary_exist.वर्धा != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "भंडारा"
  for summary_exist in @summary_exists
      if summary_exist.भंडारा != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "गोंदिया"
  for summary_exist in @summary_exists
      if summary_exist.गोंदिया != nil
        @summary_exist = summary_exist
        break
      end
    end
  elsif @district == "चंद्रपूर"
  for summary_exist in @summary_exists
      if summary_exist.चंद्रपूर != nil
        @summary_exist = summary_exist
        break
      end
    end
   elsif @district == "गडचिरोली"
  for summary_exist in @summary_exists
      if summary_exist.गडचिरोली != nil
        @summary_exist = summary_exist
        break
      end
    end
  end


	end

	def zilla_approval
		@users = User.where(:zilla_approval => "No")
	end
	def rajya_approval
		@users = User.where(:rajya_approval => "No")
	end

	def yuva_approval
		@users = User.where(:yuva_approval => "No")
	end

	def vadhuvar_approval
		@users = Vadhuvar.where(:vadhuvar_approval => "No")
	end

	def tanta_mukti_approval
		@users = Tantamukti.where(:tantamukti_approval => "No")
	end

  def zilla_disapproval
    @users = User.where(:zilla_approval => "Yes")
  end
  def rajya_disapproval
    @users = User.where(:rajya_approval => "Yes")
  end

  def yuva_disapproval
    @users = User.where(:yuva_approval => "Yes")
  end

  def vadhuvar_disapproval
    @users = Vadhuvar.where(:vadhuvar_approval => "Yes")
  end

  def tanta_mukti_disapproval
    @users = Tantamukti.where(:tantamukti_approval => "Yes")
  end

	def approval_index
		
	end
  def disapproval_index
    
  end

	def destroy
		@user = User.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @user.destroy
				redirect_to users_path
			end
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:middle_name,:gender,:birthdate,:post,:tenure,:phone,:address,:user_type,:adhikari_type,:adhikari_type_created,:bio,:work_at_district,:vadhuvar_created,:tanta_mukti_created,:karmachari_bharti_created,:avatar,:remove_avatar,:zilla_approval,:yuva_approval,:rajya_approval)
	end

end
