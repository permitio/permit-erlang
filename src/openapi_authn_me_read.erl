-module(openapi_authn_me_read).

-export([encode/1]).

-export_type([openapi_authn_me_read/0]).

-type openapi_authn_me_read() ::
    #{ 'actor' := openapi_actor:openapi_actor()
     }.

encode(#{ 'actor' := Actor
        }) ->
    #{ 'actor' => Actor
     }.
