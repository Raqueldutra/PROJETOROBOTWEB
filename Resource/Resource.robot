*** Settings ***

Library             SeleniumLibrary 

***Keywords***

Nova sessão
    Open Browser      ${url_register}        Chrome

Encerra sessão
    Capture Page Screenshot         
    Close Browser
