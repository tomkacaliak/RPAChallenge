*** Settings ***
Library    Browser
Library    CustomLibrary/ExcelToJson.py
Library    OperatingSystem

*** Variables ***
${path}    https://www.rpachallenge.com/
${excelPath}    //a[contains(text(), 'Download Excel')]

${roleInCompany}    //input[@ng-reflect-name='labelRole']
${lastName}         //input[@ng-reflect-name='labelLastName']
${firstName}        //input[@ng-reflect-name='labelFirstName']
${phoneNumber}      //input[@ng-reflect-name='labelPhone']
${address}          //input[@ng-reflect-name='labelAddress']
${email}            //input[@ng-reflect-name='labelEmail']
${comapnyName}      //input[@ng-reflect-name='labelCompanyName']

${submit}           //input[@type='submit']
${start}            //button[text()='Start']

${Download_Dir}     ${CURDIR}${/}downloads

*** Keywords ***
Open Browser
    New Browser    chromium    headless=False    downloadsPath=${Download_Dir} 
    New Context    acceptDownloads=True 

Load the Page
    [Arguments]    ${path}
    New Page    ${path}

Click to Button
    [Arguments]    ${button}
    Click    ${button}

Download the File
    [Arguments]    ${excelPath} 
    ${dl_promise}          Promise To Wait For Download    ${Download_Dir}${/}challenge.xlsx
    Click to Button    ${excelPath} 
    ${file_obj}=    Wait For    ${dl_promise}
    File Should Exist    ${file_obj}[saveAs]

Parse to JSON
    ${JSON_Data}=    ExcelToJson    ${Download_Dir}${/}challenge.xlsx
    RETURN    ${JSON_Data}

Fill the Form
    [Arguments]    ${Json_Data}
     FOR    ${element}    IN    @{JSON_Data}
        Fill Text    ${firstName}      ${element}[First Name]
        Fill Text    ${lastName}       ${element}[Last Name ]
        Fill Text    ${comapnyName}    ${element}[Company Name]
        Fill Text    ${roleInCompany}  ${element}[Role in Company]
        Fill Text    ${address}        ${element}[Address]
        Fill Text    ${email}          ${element}[Email]
        Fill Text    ${phoneNumber}    ${element}[Phone Number]
        Click    ${submit}
    END

    Wait For Elements State    text=Your success rate is 100%
*** Test Cases ***
# RPA Challenge with Browser
RPAChallenge Test
    [Documentation]    This test case automates the RPA Challenge by opening the browser, 
    ...    downloading and parsing an Excel file, 
    ...    clicking the start button, 
    ...    filling out the form with parsed data, and finally closing the browser.
    Open Browser
    Load the Page    ${path}
    Download the File    ${excelPath}
    Sleep    2s
    ${parsed_Json}=    Parse to JSON
    Click to Button    ${start}
    Fill the Form    ${parsed_Json}
    Close Browser
