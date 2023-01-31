-module(openapi_action_block_read).

-export([encode/1]).

-export_type([openapi_action_block_read/0]).

-type openapi_action_block_read() ::
    #{ 'name' => binary(),
       'description' => binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'key' => binary()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'id' := Id,
          'key' := Key
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'id' => Id,
       'key' => Key
     }.
