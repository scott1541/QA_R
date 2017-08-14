helloVariable <- "Hello World"
helloVariable


outFunc <- function(inp)
{
  temp <- inp
  temp
}
outFunc("hello world")


outFunc2 <- function(inp1, inp2)
{
  temp2 <- inp1 * inp2 
  return(temp2)
}
outFunc2(2,4)


#Conditionals 1
outFunc3 <- function(inp1, inp2, bool)
{
  if(bool){
    return(inp1 + inp2)
  } else {
    return(inp1 * inp2) 
  }
}
outFunc3(2,4, FALSE)


#Conditionals 2
condFunc2 <- function(inp1, inp2, bool)
{
  if((inp1 == 0) | (inp2 == 0)){
    return(inp1 + inp2)
  } else if(bool){
    return(inp1 + inp2)
  } else {
    return(inp1 * inp2) 
  }
}
condFunc2(0,4, TRUE)


#Recursion
recursion <- function(inp)
{
  output = c()
  
  for(i in 1:10){
    output[i] <- condFunc2(i, inp, FALSE)
  }
  return(output)
}

recursion(3)


#Anonymous function
anon <- function(func, data){
  func(data)
}

anon(function(x){x[[1]]}, recursion(3))




