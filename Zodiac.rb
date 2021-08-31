#this module is for the zodiac testing
#function for returning zodiac sign
def zfunc1(var,var2)
    if var=="april"
         
        if (var2 < 20) 
            a = "aries"
        else 
            a = "taurus" 
        end
                        
    elsif var=="may"
         
        if (var2 < 21)
            a = "taurus"
        else 
            a = "gemini"
        end
                        
    elsif var=="june"
         
        if (var2 < 21) 
            a="gemini"
        else 
            a = "cancer"
        end     

    elsif var=="july"
        
        if (var2 < 23) 
            a = "cancer"
        else 
            a = "leo"
        end    

    elsif var=="august"
         
        if (var2 < 23) 
            a="leo"
        else 
            a = "virgo"
        end   

    elsif var=="september"
         
        if (var2 < 23) 
            a = "virgo"
        else 
            a = "libra"
        end    

    elsif var=="october"

        if (var2< 23) 
            a = "libra"
        else 
            a = "scorpio"
        end 

    elsif var=="november"

        if (var2 < 22) 
            a = "scorpio"
        else 
            a = "sagittarius"
        end
            
    elsif var=="december"
        
        if (var2 < 22) 
            a="sagittarius" 
        else 
            a = "capricorn"
        end                
    elsif var=="january"
        
        if (var2 < 20) 
            a="capricorn"
        else 
            a="aquarius"
        end
                        
    elsif var=="february"
        
        if (var2 < 19)
            a="aquarius"
        else 
            a= "pisces"
        end
                        
    elsif var=="march"

        if (var2 < 21) 
            a="pisces"
        else 
            a="aries"
        end
    else

    end
    return a
end

#day format checker
def zfunc2()
    checker = "false"
    while checker != "true"
        puts "\nPlease input your birthday: \n"
        var = gets.chomp

        #checks if all charaters in a variable are numeric chracters  
        if var !~ /\D/ and var != ""
            
            var = var.to_i

            #a nested if to if check day is allowed
            if var<32
                return var
                checker = "true"
            else
                puts "\nYour inputted birth-day is invalid.Please try again\n" 
            end

        else

            puts "\nYour inputted birth-day is invalid.Please try again\n"

        end
    end
end

#month format checker
def zfunc3()
    #array of months
    marray =["january","february","march","april","may","june","july","august","september","october","november","december"]
    checker = "false"
    while checker != "true"
        puts "\nPlease input your birthmonth: \n"
        var = gets.chomp.downcase

        #checks if input is in the array
        if marray.include? var

            return var
            checker = "true"

        else
            puts "\nYour inputted birth-month is invalid.Please Try Again.\n"
        end
    end
end

#zodiac checker for user inputed zodiac
def zfunc4()
    #array of zodiacs
    marray = ["aries","taurus","gemini","cancer","leo","virgo","libra","scorpio","sagittarius","capricorn","aquarius","pisces"]
    checker = "false"
    while checker != "true"
        puts "\nPlease enter your zodiac sign: \n"
        var = gets.chomp.downcase

        if marray.include? var
            puts "\nConfirmed! Your Zodiac Sign is " + var + "\nPlease do the other test for more music recommendations."
            return var
            checker = "true"
        else
            puts "\nInvalid Response. Zodiac does not exist.\n"
        end
    end
end

            
