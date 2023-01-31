-module(openapi_opa_labels).

-export([encode/1]).

-export_type([openapi_opa_labels/0]).

-type openapi_opa_labels() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'version' := binary()
     }.

encode(#{ 'id' := Id,
          'version' := Version
        }) ->
    #{ 'id' => Id,
       'version' => Version
     }.
