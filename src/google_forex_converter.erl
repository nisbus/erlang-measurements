%%%-------------------------------------------------------------------
%%% @author nisbus  <nisbus@gmail.com>
%%% @copyright (C) 2011, 
%%% @doc
%%%
%%% @end
%%% Created :  2 Jul 2011 by  nisbus  <nisbus@gmail.com>
%%%-------------------------------------------------------------------
-module(google_forex_converter).

%% API
-export([convert/3]).

%%%===================================================================
%%% API
%%%===================================================================
convert(From,To,Value) ->
    inets:start(),
    case httpc:request("http://www.google.is/search?aq=f&sourceid=chrome&ie=UTF-8&q="++From++"+in+"++To) of 
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
