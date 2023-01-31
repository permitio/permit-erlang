-module(openapi_detailed_audit_log).

-export([encode/1]).

-export_type([openapi_detailed_audit_log/0]).

-type openapi_detailed_audit_log() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'raw_data' := openapi_raw_data:openapi_raw_data(),
       'input' => openapi_any_type:openapi_any_type(),
       'result' => openapi_any_type:openapi_any_type(),
       'context' => openapi_any_type:openapi_any_type(),
       'action' := binary(),
       'timestamp' := openapi_date_time:openapi_date_time(),
       'query' := binary(),
       'user_key' => binary(),
       'user_email' => binary(),
       'user_name' => binary(),
       'resource_type' => binary(),
       'tenant' => binary(),
       'decision' => boolean(),
       'reason' => binary(),
       'pdp_config_id' := openapi_u_uid:openapi_u_uid(),
       'env_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'org_id' := openapi_u_uid:openapi_u_uid(),
       'objects' := openapi_audit_log_objects:openapi_audit_log_objects()
     }.

encode(#{ 'id' := Id,
          'raw_data' := RawData,
          'input' := Input,
          'result' := Result,
          'context' := Context,
          'action' := Action,
          'timestamp' := Timestamp,
          'query' := Query,
          'user_key' := UserKey,
          'user_email' := UserEmail,
          'user_name' := UserName,
          'resource_type' := ResourceType,
          'tenant' := Tenant,
          'decision' := Decision,
          'reason' := Reason,
          'pdp_config_id' := PdpConfigId,
          'env_id' := EnvId,
          'project_id' := ProjectId,
          'org_id' := OrgId,
          'objects' := Objects
        }) ->
    #{ 'id' => Id,
       'raw_data' => RawData,
       'input' => Input,
       'result' => Result,
       'context' => Context,
       'action' => Action,
       'timestamp' => Timestamp,
       'query' => Query,
       'user_key' => UserKey,
       'user_email' => UserEmail,
       'user_name' => UserName,
       'resource_type' => ResourceType,
       'tenant' => Tenant,
       'decision' => Decision,
       'reason' => Reason,
       'pdp_config_id' => PdpConfigId,
       'env_id' => EnvId,
       'project_id' => ProjectId,
       'org_id' => OrgId,
       'objects' => Objects
     }.
