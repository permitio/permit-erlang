-module(openapi_permission_level_role_read).

-export([encode/1]).

-export_type([openapi_permission_level_role_read/0]).

-type openapi_permission_level_role_read() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'key' := binary(),
       'name' := binary()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'name' := Name
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'name' => Name
     }.
