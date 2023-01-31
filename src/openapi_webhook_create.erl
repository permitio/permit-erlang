-module(openapi_webhook_create).

-export([encode/1]).

-export_type([openapi_webhook_create/0]).

-type openapi_webhook_create() ::
    #{ 'url' := binary(),
       'bearer_token' => binary()
     }.

encode(#{ 'url' := Url,
          'bearer_token' := BearerToken
        }) ->
    #{ 'url' => Url,
       'bearer_token' => BearerToken
     }.
