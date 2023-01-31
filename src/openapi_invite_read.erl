-module(openapi_invite_read).

-export([encode/1]).

-export_type([openapi_invite_read/0]).

-type openapi_invite_read() ::
    #{ 'email' := binary(),
       'role' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'invite_code' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'status' := openapi_invite_status:openapi_invite_status(),
       'failed_reason' => binary()
     }.

encode(#{ 'email' := Email,
          'role' := Role,
          'id' := Id,
          'organization_id' := OrganizationId,
          'invite_code' := InviteCode,
          'created_at' := CreatedAt,
          'status' := Status,
          'failed_reason' := FailedReason
        }) ->
    #{ 'email' => Email,
       'role' => Role,
       'id' => Id,
       'organization_id' => OrganizationId,
       'invite_code' => InviteCode,
       'created_at' => CreatedAt,
       'status' => Status,
       'failed_reason' => FailedReason
     }.
