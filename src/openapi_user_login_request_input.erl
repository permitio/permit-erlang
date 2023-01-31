-module(openapi_user_login_request_input).

-export([encode/1]).

-export_type([openapi_user_login_request_input/0]).

-type openapi_user_login_request_input() ::
    #{ 'user_id' := binary(),
       'tenant_id' := binary()
     }.

encode(#{ 'user_id' := UserId,
          'tenant_id' := TenantId
        }) ->
    #{ 'user_id' => UserId,
       'tenant_id' => TenantId
     }.
