-module(openapi_organization_read_with_api_key).

-export([encode/1]).

-export_type([openapi_organization_read_with_api_key/0]).

-type openapi_organization_read_with_api_key() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'name' := binary(),
       'settings' => maps:map(),
       'api_key_id' => openapi_u_uid:openapi_u_uid(),
       'api_key_secret' => binary()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'name' := Name,
          'settings' := Settings,
          'api_key_id' := ApiKeyId,
          'api_key_secret' := ApiKeySecret
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'name' => Name,
       'settings' => Settings,
       'api_key_id' => ApiKeyId,
       'api_key_secret' => ApiKeySecret
     }.
