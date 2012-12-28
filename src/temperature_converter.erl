%%%-------------------------------------------------------------------
%%% @author  nisbus <nisbus@gmail.com>
%%% @copyright nisbus (C) 2011, 
%%% @doc
%%%    Converts temerature values from one scale to another.
%%%    See convert for supported scales.
%%% @end
%%% Created :  2 Jul 2011 by  nisbus <nisbus@gmail.com>
%%%-------------------------------------------------------------------
-module(temperature_converter).

%% API
-export([convert/3]).
%%%===================================================================
%%% API
%%%===================================================================
-spec convert(FromTemp :: celcius | fahrenheit| kelvin | rankine | delisle | newton |reaumur|romer,
	      ToTemp :: celcius | fahrenheit| kelvin | rankine | delisle | newton |reaumur|romer,
	      Value :: integer() | float()) -> 
		     integer() | float() | {error, unknown_measurement}.	     
convert(FromTemp,ToTemp,Value) when is_binary(FromTemp) and is_binary(ToTemp) ->
    To = binary_to_list(FromTemp),
    From = binary_to_list(ToTemp),
    convert(From,To,Value);

convert(FromTemp,ToTemp,Value) when is_list(FromTemp) and is_list(ToTemp) ->
    To = list_to_atom(ToTemp),
    From = list_to_atom(FromTemp),
    convert(From,To,Value);

convert(FromTemp,ToTemp,Value) ->
    To = list_to_atom(ToTemp),
    From = list_to_atom(FromTemp),
    case From of
	celcius ->
	    convert_celcius(To,Value);
	fahrenheit ->
	    convert_fahrenheit(To,Value);
	kelvin ->
	    convert_kelvin(To,Value);
	rankine ->
	    convert_rankine(To,Value);
	delisle ->
	    convert_delisle(To,Value);
	newton ->
	    convert_newton(To,Value);
	reaumur ->
	    convert_reaumur(To,Value);
	romer ->
	    convert_romer(To,Value);
	_ ->
	    {error, unknown_measurement}
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================

convert_celcius(To,Value) ->
    case To of
	celcius ->
	    Value;
	fahrenheit ->
	    Value*9/5+32;
	rankine ->
	    (Value+273.15)*(9/5);
	delisle ->
	    (100-Value)*(3/2);
	newton ->
	    Value*(33/100);
	reaumur ->
	    Value*(4/5);
	romer ->
	    Value*(21/40)+7.5;
	kelvin ->
	    Value+273.15;
	_ ->
	    {error, unknown_measurement}
    end.

convert_fahrenheit(To,Value) ->
    case To of
	celcius ->
	    (Value-32)*(5/9);
	fahrenheit ->
	    Value;
	rankine ->
	    Value+459.67;
	delisle ->
	    (212-Value)*(5/6);
	newton ->
	    (Value-32)*(11/60);
	reaumur ->
	    (Value-32)*(4/9);
	romer ->
	    (Value-32)*(4/9);
	kelvin ->
	    (Value+459.67)*5/9;
	_ ->
	    {error, unknown_measurement}
    end.
    
convert_kelvin(To,Value) ->
    case To of
	celcius ->
	    Value-273.15;
	fahrenheit ->
	    (Value*(9/5))-495.67;
	rankine ->
	    Value*(9/5);
	delisle ->
	    (373.15-Value)*(3/2);
	newton ->
	    (373.15-Value)*(3/2);
	reaumur ->
	    (Value-273.15)*(4/5);
	romer ->
	    (Value-273.15)*(4/5);
	kelvin ->
	    Value;
	_ ->
	    {error, unknown_measurement}
    end.
    
convert_rankine(To,Value) ->
    case To of
	celcius ->
	    (Value-491.67)*(5/9);
	fahrenheit ->
	    Value-459.67;
	rankine ->
	    Value;
	delisle ->
	    (671.67-Value)*(5/6);
	newton ->
	    (Value-491.67)*(11/60);
	reaumur ->
	    (Value-491.67)*(4/9);
	romer ->
	    (Value-491.67)*(7/24)+7.5;
	kelvin ->
	    Value*(5/9);
	_ ->
	    {error, unknown_measurement}
    end.

convert_delisle(To,Value) ->
    case To of
	celcius ->
	    (100-Value)*(2/3);
	fahrenheit ->
	    (212-Value)*(6/5);
	rankine ->
	    (671.67-Value)*(6/5);
	delisle ->
	    Value;
	newton ->
	    (33-Value)*(11/50);
	reaumur ->
	    (80-Value)*(8/15);
	romer ->
	    (60-Value)*(7/20);
	kelvin ->
	    (373.15-Value)*(2/3);
	_ ->
	    {error, unknown_measurement}
    end.

convert_newton(To,Value) ->
    case To of
	celcius ->
	    Value*(100/33);
	fahrenheit ->
	    Value*(6/11)+32;
	rankine ->
	    (Value*(60/11))+491.67;
	delisle ->
	    (33-Value)*(50/11);
	newton ->
	    Value;
	reaumur ->
	    Value*(80/33);
	romer ->
	    Value*(35/22)+7.5;
	kelvin ->
	    (Value*(100/33))+273.15;
	_ ->
	    {error, unknown_measurement}
    end.

convert_reaumur(To,Value) ->
    case To of
	celcius ->
	    Value*(5/4);
	fahrenheit ->
	    Value*(9/4)+32;
	rankine ->
	    (Value*(9/4))+491.67;
	delisle ->
	    (80-Value)*(15/8);
	newton ->
	    Value*(33/80);
	reaumur ->
	    Value;
	romer ->
	    Value*(21/32)+7.5;
	kelvin ->
	    Value*(5/4)+273.15;
	_ ->
	    {error, unknown_measurement}
    end.

convert_romer(To,Value) ->
    case To of
	celcius ->
	    (Value-7.5)*(40/21);
	fahrenheit ->
	    (Value-7.5)*(24/7)+32;
	rankine ->
	    (Value-7.5)*(24/7)+491.67;
	delisle ->
	    (60-Value)*(20/7);
	newton ->
	    (Value-7.5)*(22/35);
	reaumur ->
	    (Value-7.5)*(32/21);
	romer ->
	    Value*(21/40)+7.5;
	kelvin ->
	    (Value-75)*(40/21)+273.15;
	_ ->
	    {error, unknown_measurement}
    end.
