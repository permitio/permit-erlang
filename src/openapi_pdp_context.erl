-module(openapi_pdp_context).

-export([encode/1]).

-export_type([openapi_pdp_context/0]).

-type openapi_pdp_context() ::
    #{ 'customer_id' := openapi_u_uid:openapi_u_uid(),
       'client_id' := binary(),
       'backend_tier' := openapi_u_ri:openapi_u_ri(),
       'component' => binary()
     }.

encode(#{ 'customer_id' := CustomerId,
          'client_id' := ClientId,
          'backend_tier' := BackendTier,
          'component' := Component
        }) ->
    #{ 'customer_id' => CustomerId,
       'client_id' => ClientId,
       'backend_tier' => BackendTier,
       'component' => Component
     }.
