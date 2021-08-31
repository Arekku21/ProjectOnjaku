#main module

require "gosu"
require "./musicplaylist.rb"
require "./personality.rb"
require "./recommendation.rb"
require "./Zodiac.rb"

class Errorium

    attr_accessor :email, :username, :zodiac, :personality, :zdmusic, :permusic, :genmusic

    def initialize (iemail,iusername, izodiac,ipersonality,izdmusic,ipermusic,igenmusic)

        @email ,@username ,@zodiac, @personality, @zdmusic ,@permusic ,@genmusic= iemail,iusername,izodiac,ipersonality,izdmusic,ipermusic,igenmusic
        
    end
end

def savescheker a
    
    email = a.gets
    username = a.gets
    zod1 = a.gets
    pvalue = a.gets
    zmusic = a.gets
    pmusic = a.gets
    
    #process the array for genre recommendation
    gmusic = Array.new()
    
    for x in 0..12
        gmusic << a.gets
    end

    #this makes the item as complex datatype
    var1 = Errorium.new(email,username,zod1,pvalue,zmusic,pmusic,gmusic)

    return var1
end

#this is the main function flow for the program
def main
    #this variable will be the main stopper of the program
    mainchecker = "false"

    #main loop of the program
    while mainchecker != "true"

        puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Welcome To Ongaku Music Recommendation Program (version 1.0.0 edition 2)"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

        #these lines will read the storage txt for records
        storagefile = File.new("storage.txt","r")

        #this array will store all the existing data in the text file
        records_array = Array.new()

        #this is the number of records in it
        records_num = storagefile.gets.chomp.to_i

        for t in 0..records_num-1 

            records_array << savescheker(storagefile)

        end

        storagefile.close()
		
        #this loop is to full proof the question to set the variables depending if they are old or new users
        checker1 = "false"
        while checker1 != "true"
            #this variable will checks if user has been here before
            puts  "Are u continuing user or a new user ?\n[a]New User\n[b]Continuing User\n"
            user_type = gets.chomp.downcase

            
            if user_type == "a"
                #this option sets all the variables ready for the program
                gmusic = Array.new()
                for x in 0..11
                   gmusic[x] = "none" 
                end

                settervar = "none"
                #this is the complex data type item for the new record
                new_record = Errorium.new(settervar,settervar,settervar,settervar,settervar,settervar,gmusic)

                iecheck = ""
                nscheck = tfcheck = jpcheck = iecheck

                day = 0
                month = menu_check = email_check = totalie = totalns = totaltf = totaljp = day
                
                checker1 = "true"
            
            elsif user_type == "b"
                
                #this option is now to identify their old record and assign their record to the variables
                puts "Choose your saved username from the list: (Choose the number next to it)"
                for r in 0..records_array.length-1
                    puts (r+1).to_s + ": " + records_array[r].username
                end

                checker12 = "false"
                while checker12 != "true"
                    #this is their username chosen
                    username_no = gets.chomp
                    #this check if there are numbers in the string
                    if username_no !~ /\D/ and username_no != ""
            
                        username_no = username_no.to_i
            
                        #a nested if to check if number is in range
                        if username_no != 0 and username_no <= records_num
                            checker12 = "true"
                        else
                            puts "\nPlease input a number from the list.\n" 
                        end
            
                    else
                        puts "\nPlease enter value that is a number.\n"
                    end    
                end
                username_no = username_no-1
                uemail = records_array[username_no].email
                uusername = records_array[username_no].username
                uzodiac = records_array[username_no].zodiac
                upersonality = records_array[username_no].personality
                uzdmusic = records_array[username_no].zdmusic
                upermusic = records_array[username_no].permusic
                ugenmusic = records_array[username_no].genmusic

                new_record = Errorium.new(uemail,uusername,uzodiac,upersonality,uzdmusic,upermusic,ugenmusic)

                #these are utility variables for the program set default in advance
                iecheck = ""
                nscheck = tfcheck = jpcheck = iecheck

                day = 0
                month = menu_check = email_check = totalie = totalns = totaltf = totaljp = day

                checker1 = "true"
            else
                puts "\nInvalid response"
            
            end
        
            
        end
        
        checker2 = "false"
        while checker2 != "true"
            
            #gets the username from user
            puts "\nWhat is your username ? (Chance to change it if you are a returning user)"
            username = gets.chomp

            if username == ""
                puts "\nUsername cannot be empty"
            else
                new_record.username = username
                checker2 = "true"
            end

        end

        checker3 = "false"
        while checker3 != "true"
            
            puts "\nWhat is your email ? (Only accepts gmail, yahoo mail and hotmail) (Chance to change it if you are a returning user)\n"
            new_record.email = gets.chomp
            #this checks if the string entered contains the certain email treads
            if new_record.email["gmail.com"] or new_record.email["@hotmail.com"] or new_record.email["@yahoo.com"]
                checker3 = "true"
            else
                puts "\nEmail is invalid\n"
            end
        end

        #this is the main menu loop
        checker4 = "false"
        while checker4 != "true"

            puts "\nWhich test would you like to do ?\n[Z]odiac Test\nZ[o]diac Info\n[P]ersonality Test\n[G]enre Test\n[F]inal Recommendation\n\n[D]eveloper Mode(Access to storage)\n[Q]uit\n"
            menu_check = gets.chomp.downcase

            if menu_check == "z" #Zodiac Option

                checker5 = "false"
                while checker5 != "true"
                    puts "\nDo you know your zodiac?\n[Y]es or [N]o\n"
                    a = gets.chomp.downcase

                    if a=="y"

                        #a function to user input your known zodiac
                        new_record.zodiac = zfunc4()
                        
                        new_record.zdmusic=mfunc1(new_record.zodiac)

                        checker5 = "true"

                    elsif a=="n"
                        puts "\nWe will begin your Zodiac Test now\n"

                        #a function to check the day
                        day = zfunc2()

                        #a function to check if the month exists
                        month = zfunc3()                   

                        #zodiac checker function
                        new_record.zodiac = zfunc1(month,day)
                        
                        puts "\nConfirmed! Your Zodiac sign is : " + new_record.zodiac + "\nPlease do the other test for more music recommendations."                                
                        
                        new_record.zdmusic=mfunc1(new_record.zodiac)

                        checker5 = "true"

                    else

                        puts "Invalid response"

                    end
                end

            elsif menu_check=="p" #Personality Option

                checker6 = "false"
                while checker6 != "true"
                    puts "\nDo you know your personality (based on 16 personality theory?\n[Y]es\n[N]o\n"
                    b = gets.chomp.downcase

                    if b == "y"
                        #this option is to enter their own personality   
                        new_record.personality = pfunc6()
                        puts "\nConfirmed! Your Personality is " + new_record.personality + " Please do the other tests for more music recommendations."
                        
                        new_record.permusic=mfunc2(new_record.personality)

                        checker6 = "true"

                    elsif b=="n"
                        
                        #Introverted or Extroverted checker
                        iecheck = pfunc1()

                        #intuitive or observant checker
                        nscheck =  pfunc2()            

                        #thinking or feeling checker
                        tfcheck = pfunc3()
                
                        #Judging or Prospecting checker
                        jpcheck = pfunc4()

                        #actual personality       
                        new_record.personality = pfunc5(iecheck,nscheck,tfcheck,jpcheck).downcase

                        puts "\nConfirmed! Your Personality is " + new_record.personality + " Please do the other tests for more music recommendations."
                        
                        new_record.permusic=mfunc2(new_record.personality)

                        checker6 = "true"

                    else
                        puts "\nInvalid response\n"
                    end
                end

                
            elsif menu_check=="g" #Genre Option
                checker7 = "false"
                while checker7 != "true"
                    checker8 = "false"
                    while checker8 != "true"
                        #this gets their genre recommendation for each genre
                        puts "\nWhich Genre do you want to get a recommendation?\n[a]R&B\n[b]Pop\n[c]Rap\n[d]HipHop\n[e]Blues\n[f]Rock & Roll\n[g]EDM\n[h]alternative\n[i]Indie\n[j]Country\n[k]Soul\n[l]Japanese songs\n\n[Q]Back to menu\n"
                        c = gets.chomp.downcase

                        if c == "a"
                            #R&B
                            new_record.genmusic[0] = rfunc1()
                            puts "\nConfirmed! RnB Genre recommendation recorded.\n"
                        
                        elsif c=="b"
                            #Pop
                            new_record.genmusic[1] = rfunc2()
                            puts "\nConfirmed! Pop Genre recommendation recorded.\n"
                            
                        elsif c=="c"
                            #Rap
                            new_record.genmusic[2]= rfunc3()
                            puts "\nConfirmed! Rap Genre recommendation recorded.\n"
                            
                        elsif c=="d"
                            #HipHop
                            new_record.genmusic[3] = rfunc4()
                            puts "\nConfirmed! HipHop Genre recommendation recorded.\n"
                            
                        elsif c=="e"
                            #Blues
                            new_record.genmusic[4] =  rfunc5()
                            puts "\nConfirmed! Blues Genre recommendation recorded.\n"
                            
                        elsif c=="f"
                            #Rock n Roll
                            new_record.genmusic[5] = rfunc6()
                            puts "\nConfirmed! Rock and Roll Genre recommendation recorded.\n"
                            
                        elsif c=="g"
                            #EDM
                            new_record.genmusic[6] = rfunc7()
                            puts "\nConfirmed! EDM Genre recommendation recorded.\n"
                            
                        elsif c=="h"
                            #alternative
                            new_record.genmusic[7] = rfunc8()
                            puts "\nConfirmed! Alternative Genre recommendation recorded.\n"
                            
                        elsif c=="i"
                            #indie
                            new_record.genmusic[8] = rfunc9()
                            puts "\nConfirmed! Indie Genre recommendation recorded.\n"
                            
                        elsif c=="j"
                            #country
                            new_record.genmusic[9] = rfunc10()
                            puts "\nConfirmed! Country Genre recommendation recorded.\n"
                            
                        elsif c=="k"
                            #Soul
                            new_record.genmusic[10] = rfunc11()
                            puts "\nConfirmed! Soul Genre recommendation recorded.\n"
                            
                        elsif c=="l"
                            #Japanese songs
                            new_record.genmusic[11] = rfunc12()
                            puts "\nConfirmed! Japanese songs recommendation recorded.\n"
                            
                        elsif c=="q"
                            #back to menu
                            puts "\nAll Genre recommendation has been confirmed.Do the other tests for more Music Recommendation."
                            checker8 = "true"
                        
                        else
                            puts "Invalid response"
                        end
                        checker7 = "true"
                    end
                end
            elsif menu_check == "f"
                #this option finally puts all the recommendations
                checker9 = "false"
                while checker9 != "true"

                    checker10 = "false"
                    while checker10 != "true"
                        puts "\nWhich results for Music Recommendation do you want to check?\n[a]Zodiac\n[b]Personality\n[c]Genre\n\n[q]Back to menu\n"
                        d = gets.chomp.downcase

                        if d=="a"
                            #zodiac music final
                            puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            puts("Music Recommnedation as a " + new_record.zodiac + " is:")
                            new_record.zdmusic=mfunc1(new_record.zodiac)
                            puts(new_record.zdmusic)
                            puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")  
                            
                        elsif d=="b"
                            #16 personality final
                            puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            new_record.permusic=mfunc2(new_record.personality)
                            puts "Music Recommnedation as a " + new_record.personality + " is:"
                            puts(new_record.permusic)
                            puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")
                            
                        elsif d=="c"
                            #Genre recommendation final
                            if new_record.genmusic[0] == "none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("R&B Genre recommendation test was not attempted.\nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[0] !="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[0])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end

                            if new_record.genmusic[1]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Pop Genre recommendation test was not attempted.\nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[1] !="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[1])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[2]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Rap Genre recommendation test was not attempted.\nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[2]!="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[2])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[3] =="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Hip Hop Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[3]!="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[3])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[4]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Blues Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[4] !="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[4])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[5]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Rock & Roll Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[5] !="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[5])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[6]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("EDM Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[6]!="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[6])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[7]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Alternative Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[7] !="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[7])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[8]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Indie Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[8]!="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[8])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[9]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Country Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[9]!="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Country Test:" + new_record.genmusic[9])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[10]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Soul Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[10] !="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[10])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                            if new_record.genmusic[11]=="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Japanese Songs Genre recommendation test was not attempted. \nPlease do the test to have this recommendation")
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            elsif new_record.genmusic[11] !="none"
                                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                                puts("Genre Test:" + new_record.genmusic[11])
                                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                            end
                        
                        elsif d=="q"
                            #back to main menu
                            checker10 = "true"
                        
                        else
                            #error message
                            puts("Invalid Response")
                        end 
                        
                    end
                    checker9 = "true"
                end

            elsif menu_check=="d"
                checker11 = "false"
                while checker11 != "true"
                    puts ("\nEnter developer access code: \n")
                    e = gets.chomp

                    if e=="devcriedmakingthis"
                        
                        puts "\nItems in storage array: " 
                        puts records_array
                        puts "\nNumber of items in storage array" + records_array.length.to_s

                        for j in 0..records_array.length-1

                            puts "Record no. " + j.to_s
                            puts records_array[j].email
                            puts records_array[j].username
                            puts records_array[j].zodiac
                            puts records_array[j].personality
                            puts records_array[j].zdmusic
                            puts records_array[j].permusic
    
                            for y in 0..12
                                puts records_array[j].genmusic[y]
                            end
                        end
                        checker11 = "true"
                    else
                        puts("Wrong access code.")
                        checker11 = "true"
                    end
                end

            elsif menu_check=="q"
                
                #checks if type of user was new or not
                if user_type == "a" #new user
                    #putting the new value into the array to be kept at storage
                    records_array << new_record
                    records_num += 1

                    finalstorage = File.new("storage.txt","w")
                    finalstorage.puts records_num

                    for j in 0..records_array.length-1

                        finalstorage.puts records_array[j].email
                        finalstorage.puts records_array[j].username
                        finalstorage.puts records_array[j].zodiac
                        finalstorage.puts records_array[j].personality
                        finalstorage.puts records_array[j].zdmusic
                        finalstorage.puts records_array[j].permusic

                        for y in 0..12
                            finalstorage.puts records_array[j].genmusic[y]
                        end
                    end
                    finalstorage.close()

                else #old user
                    #putting back the edited data into the array of records
                    records_array[username_no] = new_record

                    finalstorage = File.new("storage.txt","w")
                    finalstorage.puts records_num

                    for j in 0..records_array.length-1

                        finalstorage.puts records_array[j].email
                        finalstorage.puts records_array[j].username
                        finalstorage.puts records_array[j].zodiac
                        finalstorage.puts records_array[j].personality
                        finalstorage.puts records_array[j].zdmusic
                        finalstorage.puts records_array[j].permusic

                        for y in 0..12
                            finalstorage.puts records_array[j].genmusic[y]
                        end
                    end
                    finalstorage.close()
                end
                
                puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                puts("Thank You for using Ongaku Music Recommendation Program version 1.0.0 edition 2.\nPlease come again.")
                puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

                checker4 = "true"

            elsif menu_check=="o"
                #this option is for zodiac info  
                checker13 = "false"

                while checker13 != "true"

                    puts "\nWhich Zodiac do you want to know about?\n[a]Aries\n[b]Taurus\n[c]Gemini\n[d]Cancer\n[e]Leo\n[f]Virgo\n[g]Libra\n[h]Scorpio\n[i]Sagittarius\n[j]Capricorn\n[k]Aquarius\n[l]Pisces\n\n[Q]Back to menu\n"
                    ans = gets.chomp.downcase

                    minfo = ["Fire signs tend to be passionate, dynamic, and temperamental.\nThey get angry quickly, but they also forgive easily.\nThey are adventurers with immense energy.\nThey are physically very strong and are a source of inspiration for others.\nFire signs are intelligent, self-aware, creative and idealistic people, always ready for action.\nThe Fire Signs are: Aries, Leo and Sagittarius.","Water signs are exceptionally emotional and ultra-sensitive.\nThey are highly intuitive and they can be as mysterious as the ocean itself.\nWater signs love profound conversations and intimacy.\nThey rarely do anything openly and are always there to support their loved ones.\nThe Water Signs are: Cancer, Scorpio and Pisces.","Earth signs are “grounded” and the ones that bring us down to earth.\n They are mostly conservative and realistic, but they can also be very emotional.\nThey are connected to our material reality and can be turned to material goods.\nThey are practical, loyal and stable and they stick by their people through hard times.\nThe Earth Signs are: Taurus, Virgo and Capricorn",
                    "Air signs are rational, social, and love communication and relationships with other people.\nThey are thinkers, friendly, intellectual, communicative and analytical.\nThey love philosophical discussions, social gatherings and good books.\nThey enjoy giving advice, but they can also be very superficial.\nThe Air Signs are: Gemini, Libra and Aquarius."]

                    if ans == "a" || ans == "e" || ans == "i"

                        zinfo = minfo[0]
                        puts "Information for  Zodiac Sign " + ans.to_s + " is: "
                        puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                        puts zinfo
                        puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

                    elsif ans == "d" || ans == "h" || ans == "l"
                        
                        zinfo = minfo[1]
                        puts "Information for  Zodiac Sign " + ans.to_s + " is: "
                        puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                        puts zinfo
                        puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

                    elsif ans == "b" || ans == "f" || ans == "j"

                        zinfo = minfo[2]
                        puts "Information for  Zodiac Sign " + ans.to_s + " is: "
                        puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                        puts zinfo
                        puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

                    elsif ans == "k" || ans == "g" || ans == "c"
                        
                        zinfo = minfo[3]
                        puts "Information for  Zodiac Sign " + ans.to_s + " is: "
                        puts("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                        puts zinfo
                        puts("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                    
                    elsif ans == "q"
                        checker13 = "true"

                    else
                        puts "\nInvalid response."
                    end
                    
                end

                
            elsif menu_check!="z" and menu_check!="p" and menu_check!="a"
                puts "Invalid Response"
            else
            end
                    
        end
        mainchecker = "true"
    end

end
main
