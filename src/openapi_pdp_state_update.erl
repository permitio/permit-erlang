-module(openapi_pdp_state_update).

-export([encode/1]).

-export_type([openapi_pdp_state_update/0]).

-type openapi_pdp_state_update() ::
    #{ 'pdp_instance_id' := openapi_u_uid:openapi_u_uid(),
       'state' := openapi_p_dp_state:openapi_p_dp_state()
     }.

encode(#{ 'pdp_instance_id' := PdpInstanceId,
          'state' := State
        }) ->
    #{ 'pdp_instance_id' => PdpInstanceId,
       'state' => State
     }.
