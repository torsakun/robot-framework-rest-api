*** Settings ***
Library     RequestsLibrary
Library     XML
Library     Collections
Library     String
Library     JSONLibrary


*** Variables ***
${URL} =      https://dataapi.moc.go.th/

*** Test Case ***
Get Data Moc
    Create Session    GetSession    ${URL}    verify=false    disable_warnings=1
    ${haeder}=    Create Dictionary    accept=application/json
    ${Response}=    Get Request    GetSession    export-commodity-countries?year=2020&month=12&com_code=333000000    headers=${haeder}    #&limit=12    
    Log To Console    ${Response.status_code}
    ${json} =    Set Variable    ${Response.json()}
    ${data_length}=      get length       ${json}
    &{TestDataDict}    Create Dictionary    key=value    key=value
    FOR     ${single_data}      IN RANGE    0    ${data_length}
        ${year}=     Convert To String        ${json[${single_data}]['year']}
        ${month}=    Convert To String        ${json[${single_data}]['month']}
        ${country_code}    Convert To String        ${json[${single_data}]['country_code']}
        ${country_name_en}    Convert To String        ${json[${single_data}]['country_name_en']}
        ${country_name_th}    Convert To String        ${json[${single_data}]['country_name_th']}
        ${unit2th}    Convert To String        ${json[${single_data}]['unit2th']}
        ${quantity}    Convert To String        ${json[${single_data}]['quantity']}
        ${acc_quantity}    Convert To String        ${json[${single_data}]['acc_quantity']}
        ${value_usd}    Convert To String        ${json[${single_data}]['value_usd']}
        ${acc_value_usd}    Convert To String        ${json[${single_data}]['acc_value_usd']}
        ${value_baht}    Convert To String        ${json[${single_data}]['value_baht']}
        ${acc_value_baht}    Convert To String        ${json[${single_data}]['acc_value_baht']}
        Log To Console    year ${year}
        Log To Console    month ${month}
        Log To Console    country_code ${country_code}
        Log To Console    country_name_en ${country_name_en}
        Log To Console    country_name_th ${country_name_th}
        Log To Console    unit2th ${unit2th}
        Log To Console    quantity ${quantity}
        Log To Console    acc_quantity ${acc_quantity}   
        Log To Console    value_usd ${value_usd}
        Log To Console    acc_value_usd ${acc_value_usd}  
        Log To Console    value_baht ${value_baht}
        Log To Console    acc_value_baht ${acc_value_baht} 
    END
