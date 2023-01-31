-module(openapi_action_block_editable).

-export([encode/1]).

-export_type([openapi_action_block_editable/0]).

-type openapi_action_block_editable() ::
    #{ 'name' => binary(),
       'description' => binary()
     }.

encode(#{ 'name' := Name,
          'description' := Description
        }) ->
    #{ 'name' => Name,
       'description' => Description
     }.
