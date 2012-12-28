%%%-------------------------------------------------------------------
%%% @author nisbus <nisbus@gmail.com>
%%% @copyright nisbus (C) 2011, 
%%% @doc
%%%   A simple forex converter that calls google search for 
%%%   conversion rates
%%% @end
%%% Created :  2 Jul 2011 by  nisbus  <nisbus@gmail.com>
%%%-------------------------------------------------------------------
-module(google_forex_converter).

%% API
-export([convert/3]).
%%%===================================================================
%%% API
%%%===================================================================
%%% @doc
%%%  Converts a currency value from one currency to another.
%%% @end
-spec convert(From :: string(), To :: string(), Value :: float() | integer()) -> 
		     float() | integer() | {error, currency_not_found}.
convert(From,To,Value) ->
    inets:start(),
    case httpc:request("http://www.google.com/search?aq=f&ie=UTF-8&q="++From++"+in+"++To) of 
	{ok,{_Status, _H, Body}} ->
	    Sub = string:substr(Body,string:str(Body," = ")+3,100),
	    case catch list_to_float(string:substr(Sub,1,string:str(Sub," ")-1)) of
		X when is_float(X) ->
		    X*Value;
		_ ->
		    {error, currency_not_found}
	    end;
	Ex ->
	    {error, Ex}
    end.
