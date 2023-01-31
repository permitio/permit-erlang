-module(openapi_dev_login).

-export([encode/1]).

-export_type([openapi_dev_login/0]).

-type openapi_dev_login() ::
    #{ 'username' := binary()
     }.

encode(#{ 'username' := Username
        }) ->
    #{ 'username' => Username
     }.
