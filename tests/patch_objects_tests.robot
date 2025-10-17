*** Settings ***
Library    RequestsLibrary
Library    BuiltIn
Library    Collections
Library    OperatingSystem
Resource          ../resources/keywords.robot
Suite Setup       Create User Session

*** Test Cases ***
getest
     Create Session    my_session    https://api.restful-api.dev
        ${response}=    GET On Session    my_session   /objects/7
        # Now you can assert the response status, content, etc.
        Status Should Be    200    ${response}
        Log To Console    ${response.status_code}
        Log To Console    ${response.json()}

#Valid PATCH Should Succeed
#    ${patch_payload}=    Create Dictionary    data={"generation": "4th", "CPU model":"Intel Core i9"}
#    ${response}=    PATCH Object    1    ${patch_payload}
#    Log To Console    ${response.status_code}
#    Status Should Be    ${response}    405
#    ${body}=    To Json    ${response.content}
#    Log To Console    ${response.json()}
#    Dictionary Should Contain Value    ${body.data.price}    4th
#    Dictionary Should Contain Value    ${body.data.CPU model}    Intel Core i9
#
#
#Patch Non-existent ID Should Fail
#    ${patch_payload}=    Create Dictionary    data={"name": "Apple Maclittle Pro 16}
#    ${response}=    PATCH Object    9999999    ${patch_payload}
#    Status Should Be    ${response}    400
#
#Invalid Payload Should Fail
#    ${invalid_payload}=    Set Variable    not-a-json
#    ${response}=    PATCH On Session    restful    /objects/1    data=${invalid_payload}    headers={"Content-Type": "application/json"}
#    Status Should Be    ${response}    404
#
#Empty Payload Should Be Handled
#    ${patch_payload}=    Create Dictionary
#    ${response}=    PATCH Object    1    ${patch_payload}
#    Status Should Be    ${response}    200
