%%%-------------------------------------------------------------------
%%% @author nisbus <nisbus@gmail.com>
%%% @copyright (C) 2011, 
%%% @doc
%%%
%%% @end
%%% Created :  1 Jul 2011 by  nisbus <nisbus@gmail.com>
%%%-------------------------------------------------------------------
-module(measurements).

-include("../include/measurement_table.hrl").
%% API
-export([convert/3]).
-export([get_measurement/1]).
-export([list_measurements/0,list_measurement_types/0,
	 list_measurements_by_type/1,list_abbreviations/0, list_abbreviations_by_type/1]).

%%%===================================================================
%%% API
%%%===================================================================
convert(To,From,Value) when is_atom(To),is_atom(From) ->
    convert(atom_to_list(To),atom_to_list(From),Value);
convert(To,From,Value) ->
    case get_measurement(To) of	
	{ToName, _ToPlural, _ToAbb, ToType, ToValue} ->
	    case get_measurement(From) of
		{FromName, _FromPlural, _FromAbb, FromType, FromValue} ->
		    case ToType == FromType of
			true ->	    
			    case ToType of
				temperature ->
				    temperature_converter:convert(ToName, FromName,Value);
				_ ->
				    (FromValue/ToValue)*Value
			    end;
			false ->
			    {error, "cannot convert "++atom_to_list(ToType)++" to "++atom_to_list(FromType)}
		    end;
		{error,Error} ->
		    Error
	    end;
	{error, Error} ->
	    Error
    end.

list_measurements() ->
    ?measurement_table.
list_measurement_types() ->
   lists:usort([Type || {_,_,_,Type,_} <- ?measurement_table]).

list_measurements_by_type(Type) when is_atom(Type) ->
   lists:usort([M || {M,_,_,T,_} <- ?measurement_table, T =:= Type]);
list_measurements_by_type(Type) when is_list(Type) ->
    list_measurements_by_type(list_to_atom(Type)).

list_abbreviations() ->
    [A || {_,_,A,_,_} <- ?measurement_table].
list_abbreviations_by_type(Type) when is_atom(Type)->
   lists:usort([A || {_,_,A,T,_} <- ?measurement_table, T =:= Type]);
list_abbreviations_by_type(Type) when is_list(Type) ->
    list_abbreviations_by_type(list_to_atom(Type)).
    
    
%%%===================================================================
%%% Internal functions
%%%===================================================================
get_measurement(Measurement) ->
    case [ {Name, Plural, Abbreviation, Type, Value} || {Name, Plural, Abbreviation, Type, Value} <- ?measurement_table,lists:member(Measurement,[Name,Plural,Abbreviation]) ] of
	[] ->
	    {error, unknown_measurement};
	[Found] ->
	    Found
    end.
