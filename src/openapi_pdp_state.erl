-module(openapi_pdp_state).

-export([encode/1]).

-export_type([openapi_pdp_state/0]).

-type openapi_pdp_state() ::
    #{ 'api_version' := integer()
     }.

encode(#{ 'api_version' := ApiVersion
        }) ->
    #{ 'api_version' => ApiVersion
     }.
