-module(openapi_data_source_config).

-export([encode/1]).

-export_type([openapi_data_source_config/0]).

-type openapi_data_source_config() ::
    #{ 'entries' := list()
     }.

encode(#{ 'entries' := Entries
        }) ->
    #{ 'entries' => Entries
     }.
