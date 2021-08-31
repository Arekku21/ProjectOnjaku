#module for the personality option

#check if the user inputted personality is true
def pfunc6()
    marray = ["intj","intp","entj","entp","infj","infp","enfj","enfp","istj","isfj","estj","esfj","istp","isfp","estp","esfp"]
    checker = "false"
    while checker != "true"
        puts "\nPlease enter your Personality:\n"
        var = gets.chomp.downcase

        if marray.include? var
            puts "\nConfirmed! Your Personality is " + var + "\nPlease do the other music recommendations test."
            return var
            checker = "true"
        else
            puts "\nInvalid Response. Personality does not exist.\n"
        end
    end
end

#introverted or extroverted checker
def pfunc1()
    #Introverted or Extroverted checker
    checker = "false"
    checker2 = "false"
    while checker != "true"
        a = 1
        b = 2
        ttl = 0
    #Chill night or club out
        while checker2 != "true"
                    
            puts "\nDo you prefer a chill quiet night or a club nightout for the weekend?\n[a]Quiet Silent\n[b]Club Nightout\n"
            q1 = gets.chomp.downcase

            if q1 == "a"
                ttl+=a
                checker2 = "true"
            elsif q1 == "b" 
                ttl+=b
                checker2 = "true"
            elsif q1!="a" || q1!="b"
                puts "\nInvalid Response"
            else

            end

        end
        
    
                         
    #heart of the party or not
        checker3 = "false"
        while checker3 != "true"
                    
            puts "\nDo you prefer to be the heart of the party?\n[a]No,not really\n[b]Yes,always\n"
            q2 = gets.chomp.downcase

            if q2=="a"
                ttl+=a
                checker3 = "true"
            elsif q2=="b"
                ttl+=b
                checker3 = "true"
            elsif q2!="a" or q2!="b"
                puts "\nInvalid Response"
            else
            end
        end

    #Quarantine easier or not
    checker4 = "false"
        while checker4 != "true"
                    
            puts "\nDo you find the Covid-19 quarantine easier to handle than most people?\n[a]Yes\n[b]No\n"
            q3 = gets.chomp.downcase

            if q3=="a"
                ttl+=a
                checker4 = "true"
            elsif q3=="b"
                ttl+=b
                checker4 = "true"
            elsif q3!="a" or q3!="b"
                puts "\nInvalid Response"
            else
            end
        end

    #assigns either introverted or extroverted       
        if ttl == 5 || ttl == 6

            var="E"
        elsif ttl==3 || ttl==4

            var="I"
        else
            
        end
        return var
        checker = "true"

    end
end

#intuitive or observant checker
def pfunc2()

    checker = "false"
    while checker != "true"
        a=1
        b=2
        tt1=0       
        #wonder future or not
        checker2 = "false"
        while checker2 != "true"
                    
            puts "\nDo you often wonder about the future and possibilities? (like eg.Technology advancements etc)\n[a]Yes\n[b]No\n"
            q4 = gets.chomp.downcase 

            if q4=="a"
                tt1+=a
                checker2 = "true"
            elsif q4=="b"
                tt1+=b
                checker2 = "true"
            elsif q4!="a" or q4!="b"
                puts "\nInvalid Response"
            else
            end
        end
        #wonder past or not
        checker3 ="false"
        while checker3 != "true"
                    
            puts "\nDo you often wonder about the past? (eg.if you have done something differently)\n[a]Yes\n[b]No\n"
            q5 = gets.chomp.downcase

            if q5=="a"
                tt1+=a
                checker3 = "true"
            elsif q5=="b"
                tt1+=b
                checker3 = "true"
            elsif q5!="a" or q5!="b"
                puts "\nInvalid Response"
            else
            end
        end                
        #what if
        checker4 ="false"
        while checker4 != "true"
                    
            puts "\nDo you often wonder of what if situations?\n[a]Yes\n[b]No\n"
            q6 = gets.chomp.downcase

            if q6=="a"
                tt1+=a
                checker4 = "true"
            elsif q6=="b"
                tt1+=b
                checker4 = "true"
            elsif q6!="a" or q6!="b"
                puts "\nInvalid Response"
            else
            end
        end

        #assigns either intituive or observant    
        if tt1==5 or tt1==6
            var="S"
        elsif tt1==3 or tt1==4
            var="N"
        else
        end

        return var       
        checker = "true"  
    end
end

#thinking or feeling checker
def pfunc3()
    checker = "false"
    while checker != "true"
        a=1
        b=2
        ttl=0
                
        #feelings get better off them
        checker2 = "false"
        while checker2 != "true"
                    
            puts "\nDoes your feelings get the better off you?\n[a]Yes\n[b]No\n"
            q7 = gets.chomp.downcase

            if q7=="a"
                ttl+=a
                checker2 = "true"
            elsif q7=="b"
                ttl+=b
                checker2 = "true"
            elsif q7!="a" or q7!="b"
                puts "\nInvalid Response"
            else
            end
        end
        #follow their heart or brain
        checker3 = "false"
        while checker3 != "true"
                    
            puts "\nDo you follow your heart or brain\n[a]Heart\n[b]Brain\n"
            q8 = gets.chomp.downcase

            if q8=="a"
                ttl+=a
                checker3 = "true"
            elsif q8=="b"
                ttl+=b
                checker3 = "true"
            elsif q8!="a" or q8!="b"
                puts "\nInvalid Response"
            else    
            end
        end

        #value emotions or rationality
        checker4 = "false"
        while checker4 != "true"
                    
            puts "\nDo you prefer emotionality or rationality?\n[a]Emotionality\n[b]Rationality\n"
            q9 = gets.chomp.downcase

            if q9=="a"
                ttl+=a
                checker4 ="true"
            elsif q9=="b"
                ttl+=b
                checker4 = "true"
            elsif q9!="a" or q9!="b"
                puts "\nInvalid Response"
            else
            end
        end                
        #assigns either intituive or observant    
        if ttl==5 or ttl==6
            var="T"
        elsif ttl==3 or ttl==4
            var="F"
        else
        end               
        return var          
        checker = "true"
    end
end

#Judging or Prospecting
def pfunc4()
    checker = "false"
    while checker != "true"
        a=1
        b=2
        ttl=0
        #well planned event or on the spot event
        checker2 = "false"
        while checker2 != "true"
                    
            puts "\nDo you prefer a well planned vacation or a roughly planned vacation ?\n[a]Well planned vacation\n[b]Roughly planned vacation\n"
            q10 = gets.chomp.downcase
            if q10=="a"
                ttl+=a
                checker2 = "true"
            elsif q10=="b"
                ttl+=b
                checker2 = "true"
            elsif q10!="a" or q10!="b"
                puts "\nInvalid Response"
            else
            end
        end            
        #perform well under pressure
        checker3 = "false"
        while checker3 != "true"
                    
            puts "\nDo you perform well underpressure?\n[a]No\n[b]Yes\n"
            q11 = gets.chomp.downcase

            if q11=="a"
                ttl+=a
                checker3 = "true"
            elsif q11=="b"
                ttl+=b
                checker3 = "true"
            elsif q11!="a" or q11!="b"
                puts "\nInvalid Response"
            else
            end
        end       
        #easy to stay in one topic or not
        checker4 = "false"
        while checker4 != "true"
                    
            puts "\nDo you find it easy to stay in one topic or hobby?\n[a]Yes\n[b]No\n"
            q12 = gets.chomp.downcase

            if q12=="a"
                ttl+=a
                checker4 = "true"
            elsif q12=="b"
                ttl+=b
                checker4 = "true"
            elsif q12!="a" or q12!="b"
                puts "\nInvalid Response"
            else
            end
        end    
        #assigns either intituive or observant    
        if ttl==5 or ttl==6
            var="P"
        elsif ttl==3 or ttl==4
            var="J"
        else
        end           
        return var
        checker = "true"
    end
end 

#to give the personality
def pfunc5(a,b,c,d)
    var=a+b+c+d
    return var
end
