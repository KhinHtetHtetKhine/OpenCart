*** Settings ***

*** Variables ***
${URL}            https://awesomeqa.com/ui/
${My_Account}    //*[@id="top-links"]/ul/li[2]/a/span[1]
${Login}    //*[@id="top-links"]/ul/li[2]/ul/li[2]/a
${Mail}    //*[@id="input-email"] 
${Password}    //*[@id="input-password"]  
${Button_Login}    //*[@id="content"]/div/div[2]/div/form/input
${Logout}    //*[@id="column-right"]/div/a[13]