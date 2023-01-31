-module(openapi_failed_invite).

-export([encode/1]).

-export_type([openapi_failed_invite/0]).

-type openapi_failed_invite() ::
    #{ 'email' := binary(),
       'reason' := binary()
     }.

encode(#{ 'email' := Email,
          'reason' := Reason
        }) ->
    #{ 'email' => Email,
       'reason' => Reason
     }.
