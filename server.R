shinyServer(
  function(input,output,session){
    bilanuploadServer("main")
    read_bilan_Server("results")
  }
)