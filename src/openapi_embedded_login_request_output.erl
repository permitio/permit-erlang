-module(openapi_embedded_login_request_output).

-export([encode/1]).

-export_type([openapi_embedded_login_request_output/0]).

-type openapi_embedded_login_request_output() ::
    #{ 'error' => binary(),
       'error_code' => integer(),
       'token' => binary(),
       'extra' => binary(),
       'redirect_url' := binary()
     }.

encode(#{ 'error' := Error,
          'error_code' := ErrorCode,
          'token' := Token,
          'extra' := Extra,
          'redirect_url' := RedirectUrl
        }) ->
    #{ 'error' => Error,
       'error_code' => ErrorCode,
       'token' => Token,
       'extra' => Extra,
       'redirect_url' => RedirectUrl
     }.
