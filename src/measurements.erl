%%%-------------------------------------------------------------------
%%% @author nisbus <nisbus@gmail.com>
%%% @copyright (C) 2011, 
%%% @doc
%%%  Measurement converter for Erlang applications.
%%%  Supported measurement types are temerature, currency and 
%%%  metric/imperial conversions.
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
%%% @doc
%%%  Converts a value from one measurement to another
%%% @end
-spec convert(From :: atom(), To :: atom(), Value :: integer()|float()) -> integer()|float()|{error,string()}.
convert(From,To,Value) when is_atom(To),is_atom(From) ->
    convert(atom_to_list(From),atom_to_list(To),Value);
convert(From,To,Value) ->
    case From =:= To of
        true -> Value;
        false ->    
            case get_measurement(To) of	
	        {ToName, _ToPlural, _ToAbb, ToType, ToValue} ->
	            case get_measurement(From) of
		        {FromName, _FromPlural, _FromAbb, FromType, FromValue} ->
		            case ToType == FromType of
			        true ->	    
			            case ToType of
				        temperature ->
				            temperature_converter:convert(FromName, ToName,Value);
				    forex ->
				        google_forex_converter:convert(FromName,ToName,Value);
				    _ ->
				       (ToValue/FromValue)*Value
			        end;
			        false ->
			            {error, "cannot convert "++atom_to_list(ToType)++" to "++atom_to_list(FromType)}
		            end;
		        {error,Error} ->
		            Error
	            end;
	        {error, Error} ->
	            Error
            end
    end.

%%% @doc
%%% Returns the measurements table with all available measurement types
%%% @end
-spec list_measurements() -> [atom()].
list_measurements() ->
    ?measurement_table.

%%% @doc
%%%  Lists all measurement types.
%%% @end
-spec list_measurement_types() -> [atom()].
list_measurement_types() ->
   lists:usort([Type || {_,_,_,Type,_} <- ?measurement_table]).

%%% @doc
%%%  Returns all measurements of a particular type
%%% @end
-spec list_measurements_by_type(Type :: atom()) -> [atom()].
list_measurements_by_type(Type) when is_atom(Type) ->
   lists:usort([M || {M,_,_,T,_} <- ?measurement_table, T =:= Type]);
list_measurements_by_type(Type) when is_list(Type) ->
    list_measurements_by_type(list_to_atom(Type)).

%%% @doc
%%%   lists the abbreviations for all measurements.
%%% @end
-spec list_abbreviations() -> [atom()].
list_abbreviations() ->
    [A || {_,_,A,_,_} <- ?measurement_table].

%%% @doc
%%%   lists the abbreviations for all measurements for a particular type.
%%% @end
-spec list_abbreviations_by_type(Type :: atom()) -> [atom()].
list_abbreviations_by_type(Type) when is_atom(Type)->
   lists:usort([A || {_,_,A,T,_} <- ?measurement_table, T =:= Type]);
list_abbreviations_by_type(Type) when is_list(Type) ->
    list_abbreviations_by_type(list_to_atom(Type)).
    
    
%%%===================================================================
%%% Internal functions
%%%===================================================================
%%% @hidden
get_measurement(Measurement) ->
    case [ {Name, Plural, Abbreviation, Type, Value} || {Name, Plural, Abbreviation, Type, Value} <- ?measurement_table,lists:member(Measurement,[Name,Plural,Abbreviation]) ] of
	[] ->
	    {error, unknown_measurement};
	[Found] ->
	    Found
    end.
