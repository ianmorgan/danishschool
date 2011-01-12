module DanishSchoolHelpers 

  def trim_with_elipse(str,len=40) 
     if str.length > len 
       str[0,len-3] + "..."
     else
       str
     end
  end

end

