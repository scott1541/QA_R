#Blackjack

blackjack <- function(input1, input2)
{
  if((input1 > 21) & (input2 > 21)){
    return(0)
  } else if(input1 > 21){
    return(input2)
  } else if(input2 > 21){
    return(input1)
  } else if(input1 > input2){
    return(input1)
  } else if(input2 > input1){
    return(input2)
  } else {
    return(0)
  }
}

blackjack(22,14)


#Unique sum
uniquesum <- function(input1, input2, input3)
{
  numbers <- c(input1, input2, input3)
  
  return(sum(unique(numbers)))
}

uniquesum(1,1,3)


#Too hot
toohot <- function(temp, summer)
{
  if(summer){
    
    if((temp >= 60) && (temp <= 100)){
      return(TRUE)
      
    } else {
      
      return(FALSE)
    }
    
  } else {
    
    if((temp >= 60) && (temp <= 90)){
      return(TRUE)
      
    } else {
      
      return(FALSE)
    }
  }
}
toohot(91, FALSE)


#Leap year
leapyear <- function(year)
{
  if(year %% 4 == 0){
    
    if((year %% 400 == 0) || (year %% 100 != 0)){
      return(TRUE)
    } else{
      return(FALSE)
    }
  } else {
    return(FALSE)
  }
}

leapyear(2004)



#Working with files
even <- c(2,4,6,8,10,12,14,16,18,20)

writeEven <- function(evenN)
{
  write.csv(evenN, "evens.csv")
}

writeEven(even)

readEven <- function()
{

   evens <- read_csv("~/GitHub/QA_R/evens.csv",col_types = cols(X1 = col_skip()))
   
   output = c()
   
   for(i in 1:10){
     output[i] <- evens[i,"x"] + 1
   }
   write.csv(output, "odds.csv")
   
   return(output)
}
readEven()


