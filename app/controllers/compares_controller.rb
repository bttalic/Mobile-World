class ComparesController < ApplicationController

  # GET /compares/1
  # GET /compares/1.json
  def show
    compare = Compare.find_by_user_id(current_user.id)
    if compare.phone1_id && compare.phone1_id != 0
      @phone1 = Phone.find(compare.phone1_id)
    end
    if compare.phone2_id && compare.phone2_id != 0
      if !@phone1
      @phone1 = Phone.find(compare.phone2_id)
    else
      @phone2 = Phone.find(compare.phone2_id)
    end
    end
    if compare.phone3_id && compare.phone3_id != 0
      if !@phone1
         @phone1 = Phone.find(compare.phone3_id)
      elsif !@phone2
         @phone2 = Phone.find(compare.phone3_id)
      else
      @phone3 = Phone.find(compare.phone3_id)
    end
    end 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compare }
    end
  end



  # GET /compares/new
  # GET /compares/new.json
  def new
    @compare = Compare.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compare }
    end
  end

  # POST /compares
  # POST /compares.json
  def create
    @compare = Compare.new(params[:compare])

    respond_to do |format|
      if @compare.save
        format.html { redirect_to @compare, notice: 'Compare was successfully created.' }
        format.json { render json: @compare, status: :created, location: @compare }
      else
        format.html { render action: "new" }
        format.json { render json: @compare.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove
    if signed_in?
      compare = Compare.find_by_user_id(current_user.id)
      if compare.phone1_id == params[:id].to_i
        compare.phone1_id = nil
      elsif compare.phone2_id == params[:id].to_i
        compare.phone2_id = nil
      elsif compare.phone3_id == params[:id].to_i
        compare.phone3_id = nil
      end
      compare.save
    end 
    redirect_to request.referer
  end

  def add
    if signed_in?
      compare = Compare.find_by_user_id(current_user.id)
      if compare.phone1_id != params[:id].to_i && compare.phone2_id != params[:id].to_i && compare.phone3_id != params[:id].to_i
        if compare.phone1_id == nil
          compare.phone1_id = params[:id].to_i
        elsif compare.phone2_id == nil
          compare.phone2_id = params[:id].to_i
        elsif compare.phone3_id == nil
          compare.phone3_id = params[:id].to_i
        end
      end
      compare.save
      redirect_to request.referer
    end 

  end

  private 
  def compareBiger(key)
   


    if !@phone1
      phone1=Phone.new
      phone1[key]=0
    else
      phone1=@phone1
    end

    if !@phone2
      phone2=Phone.new
      phone2[key]=phone1[key]
    else
      phone2=@phone2
    end

    if !@phone3
      phone3=Phone.new
      phone3[key]=phone1[key]
    else
      phone3=@phone3
    end

     alleq=false
    if(phone1[key] == phone2[key] && phone1[key] == phone3[key])
      alleq=true
    end

    string=""
    if(phone1[key] >= phone2[key] && phone1[key] >= phone3[key] && !alleq )
      string+="<td class=\"fg-color-green\">"+ (@phone1 ?  @phone1[key].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone1 ?  @phone1[key].to_s : "")+"</td>"
    end
    if(phone2[key] >= phone1[key] && phone2[key] >= phone3[key] && !alleq )
      string+="<td class=\"fg-color-green\">"+ (@phone2 ?  @phone2[key].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone2 ?  @phone2[key].to_s : "")+"</td>"
    end
    if(phone3[key] >= phone2[key] && phone3[key] >= phone1[key] && !alleq )
      string+="<td class=\"fg-color-green\">"+ (@phone3 ?  @phone3[key].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone3 ?  @phone3[key].to_s : "")+"</td>"
    end


    return string.html_safe

  end

  def compareSmaller(key)

    if !@phone1
      phone1=Phone.new
      phone1[key]="9999"
    else
      phone1=@phone1
    end

    if !@phone2
      phone2=Phone.new
      phone2[key]="9999"
    else
      phone2=@phone2
    end

    if !@phone3
      phone3=Phone.new
      phone3[key]="9999"
    else
      phone3=@phone3
    end


    alleq=false
    if(phone1[key] == phone2[key] && phone1[key] == phone3[key])
      alleq=true
    end
    string=""
    if(phone1[key] <= phone2[key] && phone1[key] <= phone3[key] && !alleq)
      string+="<td class=\"fg-color-green\">"+ (@phone1 ?  @phone1[key].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone1 ?  @phone1[key].to_s : "")+"</td>"
    end
    if(phone2[key] <= phone1[key] && phone2[key] <= phone3[key] && !alleq )
      string+="<td class=\"fg-color-green\">"+ (@phone2 ?  @phone2[key].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone2 ?  @phone2[key].to_s : "")+"</td>"
    end
    if(phone3[key] <= phone2[key] && phone3[key] <= phone1[key] && !alleq )
      string+="<td class=\"fg-color-green\">"+ (@phone3 ?  @phone3[key].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone3 ?  @phone3[key].to_s : "")+"</td>"
    end
    return string.html_safe
  end

  def compare2D(key)
    key1=key+'w'
    key2=key+'h'

  if !@phone1
      phone1=Phone.new
      phone1[key1]=9999
      phone1[key2]=9999
    else
      phone1=@phone1
    end

    if !@phone2
      phone2=Phone.new
      phone2[key1]=9999
      phone2[key2]=9999
    else
      phone2=@phone2
    end

    if !@phone3
      phone3=Phone.new
      phone3[key1]=9999
      phone3[key2]=9999
    else
      phone3=@phone3
    end


    alleq=false
    if(phone1[key1]*phone1[key2] ==phone2[key1]*phone2[key2]  && phone1[key1]*phone1[key2]  == phone3[key1]*phone3[key2] )
      alleq=true
    end

    string=""
    if(phone1[key1]*phone1[key2] >=phone2[key1]*phone2[key2]  && phone1[key1]*phone1[key2]  >= phone3[key1]*phone3[key2] && !alleq  )
      string+="<td class=\"fg-color-green\">"+ (@phone1 ?  @phone1[key1].to_s+"x"+@phone1[key2].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone1 ?  @phone1[key1].to_s+"x"+@phone1[key2].to_s : "")+"</td>"
    end
    if(phone2[key1]*phone2[key2] >=phone1[key1]*phone1[key2]  && phone2[key1]*phone2[key2]  >= phone3[key1]*phone3[key2] && !alleq  )
      string+="<td class=\"fg-color-green\">"+ (@phone2 ?  @phone2[key1].to_s+"x"+@phone2[key2].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone2 ?   @phone2[key1].to_s+"x"+@phone2[key2].to_s : "")+"</td>"
    end
    if(phone3[key1]*phone3[key2] >=phone1[key1]*phone1[key2]  && phone3[key1]*phone3[key2]  >= phone2[key1]*phone2[key2] && !alleq  )
      string+="<td class=\"fg-color-green\">"+ (@phone3 ?   @phone3[key1].to_s+"x"+@phone3[key2].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone3 ?   @phone3[key1].to_s+"x"+@phone3[key2].to_s : "")+"</td>"
    end


    return string.html_safe

  end

  def compare3D(key)
    key1=key+'w'
    key2=key+'h'
    key3=key+'d'

     if !@phone1
      phone1=Phone.new
      phone1[key1]=9999
      phone1[key2]=9999
      phone1[key3]=9999
    else
      phone1=@phone1
    end

    if !@phone2
      phone2=Phone.new
      phone2[key1]=9999
      phone2[key2]=9999
      phone2[key3]=9999
    else
      phone2=@phone2
    end

    if !@phone3
      phone3=Phone.new
      phone3[key1]=999
      phone3[key2]=999
      phone3[key3]=9999
    else
      phone3=@phone3
    end

  
    alleq=false
    if(phone1[key1]*phone1[key2]*phone1[key3] ==phone2[key1]*phone2[key2]*phone2[key3]  && phone1[key1]*phone1[key2]*phone1[key3]  == phone3[key1]*phone3[key2]*phone3[key3]  )
      alleq=true
    end


    string=""
    if(phone1[key1]*phone1[key2]*phone1[key3] >=phone2[key1]*phone2[key2]*phone2[key3]  && phone1[key1]*phone1[key2]*phone1[key3]  >= phone3[key1]*phone3[key2]*phone3[key3] && !alleq  )
      string+="<td class=\"fg-color-green\">"+ (@phone1 ?  @phone1[key1].to_s+"x"+@phone1[key2].to_s+"x"+@phone1[key3].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone1 ?  @phone1[key1].to_s+"x"+@phone1[key2].to_s+"x"+@phone1[key3].to_s : "")+"</td>"
    end
    if(phone2[key1]*phone2[key2]*phone2[key3] >=phone1[key1]*phone1[key2]*phone1[key3]  && phone2[key1]*phone2[key2]*phone2[key3]  >= phone3[key1]*phone3[key2]*phone3[key3]  && !alleq )
      string+="<td class=\"fg-color-green\">"+ (@phone2 ?  @phone2[key1].to_s+"x"+@phone2[key2].to_s+"x"+@phone2[key3].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone2 ?   @phone2[key1].to_s+"x"+@phone2[key2].to_s+"x"+@phone2[key3].to_s : "")+"</td>"
    end
    if(phone3[key1]*phone3[key2]*phone3[key3] >=phone2[key1]*phone2[key2]*phone2[key3]  && phone3[key1]*phone3[key2]*phone3[key3]  >= phone1[key1]*phone1[key2]*phone1[key3] && !alleq )
      string+="<td class=\"fg-color-green\">"+ (@phone3 ?   @phone3[key1].to_s+"x"+@phone3[key2].to_s+"x"+@phone3[key3].to_s : "")+"</td>"
    else
      string+="<td>"+ (@phone3 ?   @phone3[key1].to_s+"x"+@phone3[key2].to_s+"x"+@phone3[key3].to_s : "")+"</td>"
    end


    return string.html_safe

  end



  def compareBool(key)

        if !@phone1
      phone1=Phone.new
      phone1[key]=false
    else
      phone1=@phone1
    end

    if !@phone2
      phone2=Phone.new
      phone2[key]=false
    else
      phone2=@phone2
    end

    if !@phone3
      phone3=Phone.new
      phone3[key]=false
    else
      phone3=@phone3
    end

    string=""
    if(phone1[key]==true)
      string+="<td class=\"fg-color-green\">"+ (@phone1 ? (@phone1[key] ? "Yes" : "No") : "")+"</td>"
    else
      string+="<td class=\"fg-color-red\">"+(@phone1 ? (@phone1[key] ? "Yes" : "No") : "")+"</td>"
    end
    if(phone2[key]==true)
      string+="<td class=\"fg-color-green\">"+(@phone2 ? (@phone2[key] ? "Yes" : "No") : "")+"</td>"
    else
      string+="<td class=\"fg-color-red\">"+ (@phone2 ? (@phone2[key] ? "Yes" : "No") : "")+"</td>"
    end
    if(phone3[key]==true)
      string+="<td class=\"fg-color-green\">"+(@phone3 ? (@phone3[key] ? "Yes" : "No") : "")+"</td>"
    else
      string+="<td class=\"fg-color-red\">"+(@phone3 ? (@phone3[key] ? "Yes" : "No") : "")+"</td>"
    end


    return string.html_safe
  end

  helper_method :compareBiger, :compareBool, :compareSmaller, :compare2D, :compare3D
end
