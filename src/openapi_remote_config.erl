-module(openapi_remote_config).

-export([encode/1]).

-export_type([openapi_remote_config/0]).

-type openapi_remote_config() ::
    #{ 'opal_common' => maps:map(),
       'opal_client' := openapi_o_pal_client:openapi_o_pal_client(),
       'pdp' => openapi_pdp:openapi_pdp(),
       'context' := openapi_p_dp_context:openapi_p_dp_context()
     }.

encode(#{ 'opal_common' := OpalCommon,
          'opal_client' := OpalClient,
          'pdp' := Pdp,
          'context' := Context
        }) ->
    #{ 'opal_common' => OpalCommon,
       'opal_client' => OpalClient,
       'pdp' => Pdp,
       'context' => Context
     }.
