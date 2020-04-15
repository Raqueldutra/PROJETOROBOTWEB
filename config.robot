*** Settings ***

Library             SeleniumLibrary 

***Keywords***


Nova sessão
    Open Browser                 ${url}          Chrome

Encerra sessão
    Capture Page Screenshot         
    Close Browser
