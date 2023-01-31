-module(openapi_attribute_block_read).

-export([encode/1]).

-export_type([openapi_attribute_block_read/0]).

-type openapi_attribute_block_read() ::
    #{ 'type' := openapi_attribute_type:openapi_attribute_type(),
       'description' => binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'key' => binary()
     }.

encode(#{ 'type' := Type,
          'description' := Description,
          'id' := Id,
          'key' := Key
        }) ->
    #{ 'type' => Type,
       'description' => Description,
       'id' => Id,
       'key' => Key
     }.
