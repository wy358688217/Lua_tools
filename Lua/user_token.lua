local http_head_config = require("http_head_config")
print(http_head_config)
http_head_config.set_device_id("10086")
local _device_id = http_head_config.get_device_id()
print(_device_id)

--  local userToken  = {
--  "time":1470457552263,
--  "sign":"b19a034da0ea490f0331f8014d41ae76",
--  "uid":"20160806122552263~629962554",
--  "token":"IFe51txrQpM6T64HWOHDOx1kZC0Jb73pYT3E2gS\/Q7SHRHH1d2x\/3GLUEIKADRiG",
--  "rm":"pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M\/7b7aG0cShg2aDI4a4iOKo6yPHiFLFWQLIaglYv26iLdCkfqxvKHV+7W1UEuxa6eOkC1ZLuyw\/spr4fDB88s9RxWfm2L4WO\/CLCAZrpba\/TrxDhIU4ET6v7BB2cRyhRKQnkaS4YFU2jNlOdTLUlAQ2ika+eWU9HkwqcDzWzdOYigK99FFhcY48FSQzp9HPX+L3QfPBB8prCpXxYej9h6dXmjZ65U5qjjDnMTvHYUQSB1rdK3zv3WFJQQLongWK0shcLmAdPxGHLq+0y++9C6kLZlePO4MYrfoR0crhVAlImJ"}
-- [[time=1470457552263&sign=b19a034da0ea490f0331f8014d41ae76&uid=20160806122552263~629962554&token=IFe51txrQpM6T64HWOHDOx1kZC0Jb73pYT3E2gS\/Q7SHRHH1d2x\/3GLUEIKADRiG&rm=pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M\/7b7aG0cShg2aDI4a4iOKo6yPHiFLFWQLIaglYv26iLdCkfqxvKHV+7W1UEuxa6eOkC1ZLuyw\/spr4fDB88s9RxWfm2L4WO\/CLCAZrpba\/TrxDhIU4ET6v7BB2cRyhRKQnkaS4YFU2jNlOdTLUlAQ2ika+eWU9HkwqcDzWzdOYigK99FFhcY48FSQzp9HPX+L3QfPBB8prCpXxYej9h6dXmjZ65U5qjjDnMTvHYUQSB1rdK3zv3WFJQQLongWK0shcLmAdPxGHLq+0y++9C6kLZlePO4MYrfoR0crhVAlImJ]]


-- {"time":1470457552263,
-- "sign":"b19a034da0ea490f0331f8014d41ae76",
-- "uid":"20160806122552263~629962554",
-- "token":"IFe51txrQpM6T64HWOHDOx1kZC0Jb73pYT3E2gS\/Q7SHRHH1d2x\/3GLUEIKADRiG",
-- "rm":"pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M\/7b7aG0cShg2aDI4a4iOKo6yPHiFLFWQLIaglYv26iLdCkfqxvKHV+7W1UEuxa6eOkC1ZLuyw\/spr4fDB88s9RxWfm2L4WO\/CLCAZrpba\/TrxDhIU4ET6v7BB2cRyhRKQnkaS4YFU2jNlOdTLUlAQ2ika+eWU9HkwqcDzWzdOYigK99FFhcY48FSQzp9HPX+L3QfPBB8prCpXxYej9h6dXmjZ65U5qjjDnMTvHYUQSB1rdK3zv3WFJQQLongWK0shcLmAdPxGHLq+0y++9C6kLZlePO4MYrfoR0crhVAlImJ"}
-- local userTokenMap = {
--   ["time"] = 1470472957415,
--   ["sign"] = "60e082b1f6e8f89331078561ab62bab5",
--   ["uid"] = "20160806164237415~71277407",
--   ["token"] = "fttrt/FG45R6IwAxErawBLpa4c47pHaMNLILzOTIl4fFZogpNZhAWVfE8HeytcmR",
--   ["rm"] = "pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M/0ky98LOTOY+h15XiTxCVnG4r/wrodkTk1I4wCpwQPg2YVEUulfhbV2WNUJ1aU6t933fxmeWrVi/M9bzNyl8sN+S0KGuYAEuBgma0hrm2tzVF/9zhzXwTx/vyf0xiUAivjfo1MejHPLLtdPo6zVLYmpNPiETIw1n9nVO0kA5g74vK5jVsgIcgA9iBj/WZxR187NXAobO+Kiny18mx+qRIq53j/nFSoFVu53Pqbh3mfwSIIyy2i9tnJnSB26T0KhwIe8LuD9R3bfubyWx7FhCMdRWgyQDpFVb1ty0K5J9RKlV"
-- } --android
-- ["token"] = "IFe51txrQpM6T64HWOHDOx1kZC0Jb73pYT3E2gS\/Q7SHRHH1d2x\/3GLUEIKADRiG"，
-- ["rm"] = "pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M\/7b7aG0cShg2aDI4a4iOKo6yPHiFLFWQLIaglYv26iLdCkfqxvKHV+7W1UEuxa6eOkC1ZLuyw\/spr4fDB88s9RxWfm2L4WO\/CLCAZrpba\/TrxDhIU4ET6v7BB2cRyhRKQnkaS4YFU2jNlOdTLUlAQ2ika+eWU9HkwqcDzWzdOYigK99FFhcY48FSQzp9HPX+L3QfPBB8prCpXxYej9h6dXmjZ65U5qjjDnMTvHYUQSB1rdK3zv3WFJQQLongWK0shcLmAdPxGHLq+0y++9C6kLZlePO4MYrfoR0crhVAlImJ"}

-- local device_id  = "AtqJp9cfm3GcbHG6dTUHkQvJAxfAQdcS98aa_J1Wvwag" --android
-- local userToken  = {"time":1470457552263,"sign":"b19a034da0ea490f0331f8014d41ae76","uid":"20160806122552263~629962554","token":"IFe51txrQpM6T64HWOHDOx1kZC0Jb73pYT3E2gS\/Q7SHRHH1d2x\/3GLUEIKADRiG","rm":"pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M\/7b7aG0cShg2aDI4a4iOKo6yPHiFLFWQLIaglYv26iLdCkfqxvKHV+7W1UEuxa6eOkC1ZLuyw\/spr4fDB88s9RxWfm2L4WO\/CLCAZrpba\/TrxDhIU4ET6v7BB2cRyhRKQnkaS4YFU2jNlOdTLUlAQ2ika+eWU9HkwqcDzWzdOYigK99FFhcY48FSQzp9HPX+L3QfPBB8prCpXxYej9h6dXmjZ65U5qjjDnMTvHYUQSB1rdK3zv3WFJQQLongWK0shcLmAdPxGHLq+0y++9C6kLZlePO4MYrfoR0crhVAlImJ"}

  -- ["questionSubjctId"] = 3294
  -- ["uName"] = "13611857963",
  -- ["password"] = "123456

-- local user_token_new = [[time=1470457552263&sign=b19a034da0ea490f0331f8014d41ae76&uid=20160806122552263~629962554&token=IFe51txrQpM6T64HWOHDOx1kZC0Jb73pYT3E2gS/Q7SHRHH1d2x/3GLUEIKADRiG&rm=pXYUM4hEDdP9xlDNqAkMtJyBpIMhFqwY8EgXQDSCYMsPwdCxHcBHq45R25qUf0oMcBskM2j3mwVmABpjit+M/7b7aG0cShg2aDI4a4iOKo6yPHiFLFWQLIaglYv26iLdCkfqxvKHV+7W1UEuxa6eOkC1ZLuyw/spr4fDB88s9RxWfm2L4WO/CLCAZrpba/TrxDhIU4ET6v7BB2cRyhRKQnkaS4YFU2jNlOdTLUlAQ2ika+eWU9HkwqcDzWzdOYigK99FFhcY48FSQzp9HPX+L3QfPBB8prCpXxYej9h6dXmjZ65U5qjjDnMTvHYUQSB1rdK3zv3WFJQQLongWK0shcLmAdPxGHLq+0y++9C6kLZlePO4MYrfoR0crhVAlImJ]]
-- local user_token_new_json = json.encode(user_token_new)

-- print(string.len(request_body))


-- print(string.len(request_body))