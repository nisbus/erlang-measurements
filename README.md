A measurement converter for erlang.  
  
Currently supports temperature, volume, distance, cooking and forex (thanks google) conversions.  
  
HOW TO USE:  
  
measurements:convert(FromMeasurement, ToMeasurement, Value).  
  
To and From measurements can be abbreviations, names and plurals either as atoms or strings.  
  
The api also includes functions to list measurements:  
  
list_measurements()  
list_measurement_types()  
list_measurements_by_type(Type)  
list_abbreviations()  
list_abbreviations_by_type(Type)  
  
TODO:  
  
I have yet to write unit tests to verify that I don't have wrong measurements in the .hrl file.  
Add more measurements  
Write documentations (specs).