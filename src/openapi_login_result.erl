-module(openapi_login_result).

-export([encode/1]).

-export_type([openapi_login_result/0]).

-type openapi_login_result() ::
    #{ 'logged_in' := boolean(),
       'expires_at' := integer(),
       'active_org_id' => openapi_u_uid:openapi_u_uid(),
       'invite_attempt' => openapi_invite_attempt_result:openapi_invite_attempt_result()
     }.

encode(#{ 'logged_in' := LoggedIn,
          'expires_at' := ExpiresAt,
          'active_org_id' := ActiveOrgId,
          'invite_attempt' := InviteAttempt
        }) ->
    #{ 'logged_in' => LoggedIn,
       'expires_at' => ExpiresAt,
       'active_org_id' => ActiveOrgId,
       'invite_attempt' => InviteAttempt
     }.
