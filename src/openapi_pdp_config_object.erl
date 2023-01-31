-module(openapi_pdp_config_object).

-export([encode/1]).

-export_type([openapi_pdp_config_object/0]).

-type openapi_pdp_config_object() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'name' := binary()
     }.

encode(#{ 'id' := Id,
          'name' := Name
        }) ->
    #{ 'id' => Id,
       'name' => Name
     }.
