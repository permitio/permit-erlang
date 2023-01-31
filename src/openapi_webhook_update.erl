-module(openapi_webhook_update).

-export([encode/1]).

-export_type([openapi_webhook_update/0]).

-type openapi_webhook_update() ::
    #{ 'url' => binary(),
       'bearer_token' => binary()
     }.

encode(#{ 'url' := Url,
          'bearer_token' := BearerToken
        }) ->
    #{ 'url' => Url,
       'bearer_token' => BearerToken
     }.
