-module(openapi_attribute_block_editable).

-export([encode/1]).

-export_type([openapi_attribute_block_editable/0]).

-type openapi_attribute_block_editable() ::
    #{ 'type' := openapi_attribute_type:openapi_attribute_type(),
       'description' => binary()
     }.

encode(#{ 'type' := Type,
          'description' := Description
        }) ->
    #{ 'type' => Type,
       'description' => Description
     }.
