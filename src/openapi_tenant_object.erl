-module(openapi_tenant_object).

-export([encode/1]).

-export_type([openapi_tenant_object/0]).

-type openapi_tenant_object() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'key' := binary(),
       'name' => binary(),
       'attributes' => maps:map(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'name' := Name,
          'attributes' := Attributes,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'name' => Name,
       'attributes' => Attributes,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt
     }.
