-module(openapi_invite_attempt_result).

-export([encode/1]).

-export_type([openapi_invite_attempt_result/0]).

-type openapi_invite_attempt_result() ::
    #{ 'invite_successful' => boolean(),
       'invite_failed_reason' => binary()
     }.

encode(#{ 'invite_successful' := InviteSuccessful,
          'invite_failed_reason' := InviteFailedReason
        }) ->
    #{ 'invite_successful' => InviteSuccessful,
       'invite_failed_reason' => InviteFailedReason
     }.
