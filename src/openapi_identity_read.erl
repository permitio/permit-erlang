-module(openapi_identity_read).

-export([encode/1]).

-export_type([openapi_identity_read/0]).

-type openapi_identity_read() ::
    #{ 'user_id' := binary(),
       'provider' := binary(),
       'sub' := binary(),
       'email' := binary(),
       'email_verified' := boolean(),
       'auth0_info' := maps:map()
     }.

encode(#{ 'user_id' := UserId,
          'provider' := Provider,
          'sub' := Sub,
          'email' := Email,
          'email_verified' := EmailVerified,
          'auth0_info' := Auth0Info
        }) ->
    #{ 'user_id' => UserId,
       'provider' => Provider,
       'sub' => Sub,
       'email' => Email,
       'email_verified' => EmailVerified,
       'auth0_info' => Auth0Info
     }.
