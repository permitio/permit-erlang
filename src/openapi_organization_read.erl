-module(openapi_organization_read).

-export([encode/1]).

-export_type([openapi_organization_read/0]).

-type openapi_organization_read() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'name' := binary(),
       'settings' => maps:map()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'name' := Name,
          'settings' := Settings
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'name' => Name,
       'settings' => Settings
     }.
